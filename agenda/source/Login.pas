unit Login;

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
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg,
  Vcl.Themes,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  PraButtonStyle,
  Factory,
  Parametros;

type
  TFrmLogin = class(TForm)
    lblAppName: TLabel;
    Label1: TLabel;
    TX_Usuario: TEdit;
    TX_Senha: TEdit;
    Label2: TLabel;
    btnAcessar: TPraButtonStyle;
    btnCancelar: TPraButtonStyle;
    Panel1: TPanel;
    lblVersao: TLabel;
    pnlImagem: TPanel;
    Image1: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    aFactory : TFactory;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses
  uDMConexao;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
var
  aFDQuery : TFDQuery;
  aStrBuilder : TStringBuilder;
begin
  if String(TX_Usuario.Text).IsEmpty or String(TX_Senha.Text).IsEmpty then
  begin
    Application.MessageBox('Informe o usuário e senha para efetuar o login na aplicação.', 'Atenção', MB_OK+MB_ICONWARNING);
    TX_Usuario.SetFocus;
    Abort;
  end else begin
    aFDQuery            := TFDQuery.Create(nil);
    aFDQuery.Connection := DMConexao.FDConexao;
    aStrBuilder         := TStringBuilder.Create;
    aFDQuery.Connection.StartTransaction;
    try
      aStrBuilder.AppendLine('SELECT CO_USUARIO, NM_USUARIO, NM_LOGIN, CO_PERFIL, TX_SENHA ')
                 .AppendLine('  FROM UC_USUARIO                                            ')
                 .AppendLine('  WHERE NM_LOGIN    = :NM_LOGIN AND                          ')
                 .AppendLine('        IN_LIBERADO = ''TRUE'';                              ');

      aFDQuery.SQL.Text                         := aStrBuilder.ToString;
      aFDQuery.ParamByName('NM_LOGIN').AsString := Trim(TX_Usuario.Text);
      aFDQuery.Open;
      aFDQuery.Connection.Commit;
      if aFDQuery.FieldByName('NM_LOGIN').IsNull then
      begin
        Application.MessageBox('Dados de login não confere, verifique!', 'Atenção', MB_OK+MB_ICONWARNING);
        Inc(wMaxTentativasLogin);
        if wMaxTentativasLogin = 3 then
          Application.Terminate;
        Abort;
      end else
      begin
        if aFDQuery.FieldByName('TX_SENHA').AsString <> aFactory.GetStrHashSHA512_256(TX_Senha.Text) then
        begin
          Application.MessageBox('Dados de login não confere, verifique!', 'Atenção', MB_OK+MB_ICONWARNING);
          Inc(wMaxTentativasLogin);
          if wMaxTentativasLogin = 3 then
          begin
            aStrBuilder.Clear;
            aStrBuilder.AppendLine('UPDATE UC_USUARIO             ')
                       .AppendLine('  SET IN_LIBERADO = ''FALSE'' ')
                       .AppendLine('  WHERE NM_LOGIN = :NM_LOGIN; ');

            aFDQuery.Connection.StartTransaction;
            aFDQuery.SQL.Text := aStrBuilder.ToString;
            aFDQuery.ParamByName('NM_LOGIN').AsString := Trim(TX_Usuario.Text);
            try
              aFDQuery.ExecSQL;
            except
              on e : Exception do
              begin
                aFDQuery.Connection.Rollback;
                raise Exception.Create(e.Message);
              end;
            end;
            Application.Terminate;
          end;
        end;
        TParametro.co_usuario := aFDQuery.FieldByName('CO_USUARIO').AsInteger;
        TParametro.nm_usuario := aFDQuery.FieldByName('NM_USUARIO').AsString;
        TParametro.nm_login   := UpperCase(TX_Usuario.Text).Trim;
        TParametro.tx_senha   := aFactory.Cripto('E', TX_Senha.Text, '1024');
        DMConexao.FDConexao.Close;
        DMConexao.FDConexao.Params.Clear;
        DMConexao.FDConexao.Params.Values['DriverID']  := 'FB';
        DMConexao.FDConexao.Params.Values['Server']    := aFactory.Cripto('D', wServidor, '512');
        DMConexao.FDConexao.Params.Values['Protocol']  := 'TCPIP';
        DMConexao.FDConexao.Params.Values['Port']      := aFactory.Cripto('D', wPorta,    '512');
        DMConexao.FDConexao.Params.Values['RoleName']  := 'RDB$ADMIN';
        DMConexao.FDConexao.Params.Values['Database']  := aFactory.Cripto('D', wBase,     '512');
        DMConexao.FDConexao.Params.Values['User_name'] := TParametro.nm_login;
        DMConexao.FDConexao.Params.Values['Password']  := TX_Senha.Text;
        wLoginLogout := True;
        try
          DMConexao.FDConexao.Connected                := True;
        except
          on e : Exception do begin
            raise Exception.Create('Classe: ' + e.ClassName + ' erro: ' + e.Message);
          end;
        end;
      end;
    finally
      FreeAndNil(aFDQuery);
      FreeAndNil(aStrBuilder);
    end;
    Self.Close;
  end;
end;

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  aFactory := TFactory.Create;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
//  aFactory.ArredondarCantosControle(Self);
  aFactory.ArredondarCantosControle(pnlImagem);
  lblVersao.Caption := 'Versão: ' + aFactory.GetVersionInfo(Application.ExeName);
  lblAppName.Caption := ExtractFileName(Application.ExeName).Replace('.exe', '', [rfIgnoreCase]);
  btnAcessar.SetFocus;
  if FileExists(ExtractFilePath(ParamStr(0))+'helio.job') then
  begin
    TX_Usuario.Text := 'holiveira';
    TX_Senha.Text   := '65@Monster';
  end;
end;

end.
