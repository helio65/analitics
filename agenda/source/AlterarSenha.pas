unit AlterarSenha;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  PraButtonStyle,
  Factory,
  Parametros;

type
  TFrmAlterarSenha = class(TForm)
    lblAppName: TLabel;
    Label1: TLabel;
    TX_SenhaAtual: TEdit;
    Label2: TLabel;
    TX_NovaSenha: TEdit;
    btnCancelar: TPraButtonStyle;
    btnAcessar: TPraButtonStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TX_SenhaAtualExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TX_NovaSenhaChange(Sender: TObject);
    procedure TX_NovaSenhaExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }
    aStrBuilder : TStringBuilder;
    aFDQuery : TFDQuery;
    aFactory : TFactory;
    aSenhaValidada : Boolean;
  public
    { Public declarations }
  end;

var
  FrmAlterarSenha: TFrmAlterarSenha;

implementation

{$R *.dfm}

uses
  uDMConexao;

procedure TFrmAlterarSenha.btnAcessarClick(Sender: TObject);
begin
  if String(TX_NovaSenha.Text).IsEmpty then
    Abort;

  aStrBuilder.Clear;
  aStrBuilder.AppendLine('UPDATE UC_USUARIO                 ')
             .AppendLine('  SET TX_SENHA = :TX_SENHA        ')
             .AppendLine('  WHERE CO_USUARIO = :CO_USUARIO; ');

  aFDQuery.SQL.Text := aStrBuilder.ToString;
  aFDQuery.ParamByName('TX_SENHA').AsString    := aFactory.GetStrHashSHA512_256(Trim(TX_NovaSenha.Text));
  aFDQuery.ParamByName('CO_USUARIO').AsInteger := TParametro.co_usuario;
  try
    aFDQuery.Connection.StartTransaction;
    aFDQuery.ExecSQL;

    aFDQuery.SQL.Clear;
    aFDQuery.SQL.Text := 'ALTER CURRENT USER SET PASSWORD ' + QuotedStr(wSenha) + ';';
    aFDQuery.ExecSQL;

    aFDQuery.Connection.Commit;
  except
    on e : Exception do
    begin
      aFDQuery.Connection.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
  Application.MessageBox('Senha alterada com sucesso!', 'Atenção', MB_OK+MB_ICONINFORMATION);
  Self.Close;
end;

procedure TFrmAlterarSenha.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmAlterarSenha.FormCreate(Sender: TObject);
begin
  aFactory            := TFactory.Create;
  aStrBuilder         := TStringBuilder.Create;
  aFDQuery            := TFDQuery.Create(nil);
  aFDQuery.Connection := DMConexao.FDConexao;
end;

procedure TFrmAlterarSenha.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
  FreeAndNil(aStrBuilder);
  FreeAndNil(aFDQuery);
end;

procedure TFrmAlterarSenha.FormShow(Sender: TObject);
begin
  aSenhaValidada := False;
end;

procedure TFrmAlterarSenha.TX_NovaSenhaChange(Sender: TObject);
begin
  if not aSenhaValidada then
  begin
    Application.MessageBox('Informe primeiro a senha atual.', 'Atenção', MB_OK+MB_ICONWARNING);
    TX_SenhaAtual.SetFocus;
    Abort;
  end;
end;

procedure TFrmAlterarSenha.TX_NovaSenhaExit(Sender: TObject);
var
  aMensagem : String;
begin
  if (not String(TX_NovaSenha.Text).IsEmpty) and (aSenhaValidada) then
  begin
    aMensagem := 'Sua senha deve conter no mínimo:       ' + #13 +
                 '      8 Caracteres                     ' + #13 +
                 '      1 Caracter especial (*, #, $...) ' + #13 +
                 '      1 Letra minúscula                ' + #13 +
                 '      1 Letra maiúscula                ';
    if not aFactory.StrongPassword(TX_NovaSenha.Text) then
    begin
      Application.MessageBox(PWideChar(aMensagem), 'Atenção', MB_OK+MB_ICONWARNING);
      TX_NovaSenha.SetFocus;
      Abort;
    end;

    wSenha := InputBox('Redigite a senha', #31'Senha', '');
    if wSenha <> TX_NovaSenha.Text then
    begin
      Application.MessageBox('Os valores da nova senha e da confirmação não são iguais, por favor corrija', 'Atenção', MB_OK+MB_ICONERROR);
      TX_NovaSenha.SetFocus;
      Abort;
    end;
  end;
end;

procedure TFrmAlterarSenha.TX_SenhaAtualExit(Sender: TObject);
begin
  if not String(TX_SenhaAtual.Text).IsEmpty then
  begin
    aSenhaValidada := False;

    aStrBuilder.AppendLine('SELECT TX_SENHA                   ')
               .AppendLine('  FROM UC_USUARIO                 ')
               .AppendLine('  WHERE CO_USUARIO = :CO_USUARIO; ');

    aFDQuery.Close;
    aFDQuery.SQL.Clear;
    aFDQuery.Open(aStrBuilder.ToString, [TParametro.co_usuario]);

    if aFDQuery.FieldByName('TX_SENHA').AsString <> aFactory.GetStrHashSHA512_256(TX_SenhaAtual.Text) then
    begin
      Application.MessageBox('Senha inválida, verifique!', 'Atenção', MB_OK+MB_ICONERROR);
      TX_SenhaAtual.SetFocus;
      TX_SenhaAtual.SetFocus;
      Abort;
    end else
      aSenhaValidada := True;
  end;
end;

end.
