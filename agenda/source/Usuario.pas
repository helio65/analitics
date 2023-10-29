unit Usuario;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Generics.Collections,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ImgList,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Factory,
  Parametros,
  Persistence,
  CamposPesquisa,
  PraButtonStyle, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.StorageBin;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmUsuario = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    dtsUsuario: TDataSource;
    Panel1: TPanel;
    pcPrincipal: TPageControl;
    tabConsulta: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    comboCampo: TComboBox;
    comboCondicao: TComboBox;
    edtValor: TEdit;
    Panel3: TPanel;
    Grid: TDBGrid;
    tabCadastro: TTabSheet;
    Panel4: TPanel;
    btnNovo: TPraButtonStyle;
    btnEditar: TPraButtonStyle;
    btnExcluir: TPraButtonStyle;
    btnGravar: TPraButtonStyle;
    btnCancelar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    btnAlternar: TPraButtonStyle;
    btnPesquisa: TPraButtonStyle;
    FDDUsuario: TFDQuery;
    FDDUsuarioCO_USUARIO: TIntegerField;
    FDDUsuarioCO_EMPRESA: TIntegerField;
    FDDUsuarioCO_PERFIL: TIntegerField;
    FDDUsuarioNM_USUARIO: TStringField;
    FDDUsuarioNM_LOGIN: TStringField;
    FDDUsuarioIN_LIBERADO: TBooleanField;
    FDDUsuarioTX_SENHA: TStringField;
    FDDUsuarioTX_EMAIL: TStringField;
    FDDUsuarioDT_ALTERACAO: TSQLTimeStampField;
    Label4: TLabel;
    Label5: TLabel;
    CO_USUARIO: TDBEdit;
    NM_USUARIO: TDBEdit;
    Label6: TLabel;
    NM_LOGIN: TDBEdit;
    Label8: TLabel;
    IN_LIBERADO: TDBLookupComboBox;
    dtsSituacao: TDataSource;
    FDMSituacao: TFDMemTable;
    FDMSituacaoCO_SITUACAO: TBooleanField;
    FDMSituacaoTX_SITUCAO: TStringField;
    Label7: TLabel;
    TX_SENHA: TDBEdit;
    Label10: TLabel;
    TX_EMAIL: TDBEdit;
    Label11: TLabel;
    CO_PERFIL: TDBLookupComboBox;
    dtsPerfil: TDataSource;
    FDQPerfil: TFDQuery;
    FDDUsuarioCO_USUARIOX: TIntegerField;
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure dtsUsuarioStateChange(Sender: TObject);
    procedure FDDUsuarioAfterEdit(DataSet: TDataSet);
    procedure FDDUsuarioBeforePost(DataSet: TDataSet);
    procedure FDDUsuarioNewRecord(DataSet: TDataSet);
    procedure TX_SENHAExit(Sender: TObject);
    procedure FDDUsuarioAfterPost(DataSet: TDataSet);
    procedure FDDUsuarioNM_USUARIOValidate(Sender: TField);
    procedure FDDUsuarioTX_EMAILValidate(Sender: TField);
    procedure FDDUsuarioNM_LOGINValidate(Sender: TField);
    procedure FDDUsuarioIN_LIBERADOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    aFactory : TFactory;
    aPersistence : TPersistence;
    FCamposPesquisa: TObjectList<TCamposPesquisa>;
    FTabela: String;
    wSenha : String;
    procedure SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
    procedure SetTabela(const Value: String);
    property CamposPesquisa : TObjectList<TCamposPesquisa> read FCamposPesquisa write SetCamposPesquisa;
    property Tabela : String read FTabela write SetTabela;
    procedure AdicionarCamposPesquisa;
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

uses
  uDMConexao;

procedure TFrmUsuario.AdicionarCamposPesquisa;
var
  wIndex : Integer;
begin
  try
    wIndex         := 0;
    Tabela         := 'UC_USUARIO';
    CamposPesquisa := TObjectList<TCamposPesquisa>.Create;
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'CO_USUARIO';
    CamposPesquisa[wIndex].Descricao := 'Código';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_USUARIO';
    CamposPesquisa[wIndex].Descricao := 'Nome';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_LOGIN';
    CamposPesquisa[wIndex].Descricao := 'Login';

    comboCampo.Items.Clear;
    for wIndex := 0 to Pred(CamposPesquisa.Count) do
    begin
      comboCampo.Items.AddObject(String(CamposPesquisa[wIndex].Descricao), TOBject(CamposPesquisa[wIndex].Campo));
    end;
    comboCampo.ItemIndex := 1;
  finally
//    FreeAndNil(FCamposPesquisa);
  end;
end;

procedure TFrmUsuario.btnAlternarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 0;
  pcPrincipalChange(Sender);
end;

procedure TFrmUsuario.btnCancelarClick(Sender: TObject);
begin
  aPersistence.Cancelar(FDDUsuario);
end;

procedure TFrmUsuario.btnEditarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Editar(FDDUsuario);
end;

procedure TFrmUsuario.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
    aPersistence.Excluir(FDDUsuario);
end;

procedure TFrmUsuario.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmUsuario.btnGravarClick(Sender: TObject);
begin
  aPersistence.Gravar(FDDUsuario);
  FDDUsuario.RefreshRecord();
end;

procedure TFrmUsuario.btnNovoClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Incluir(FDDUsuario);
  NM_USUARIO.SetFocus;
end;

procedure TFrmUsuario.btnPesquisaClick(Sender: TObject);
var
  wStrBuilder : TStringBuilder;
begin
  if String(edtValor.Text).IsEmpty then
  begin
    Application.MessageBox('Informe o valor a ser pesquisado.', 'Atenção', MB_OK+MB_ICONWARNING);
    Abort;
  end;
  wStrBuilder := TStringBuilder.Create;
  try
    wStrBuilder.AppendLine('SELECT *         ')
               .AppendLine('  FROM ' + Tabela );
    case comboCondicao.ItemIndex of
      0 : begin
            wStrBuilder.AppendLine('  WHERE ' + String(comboCampo.Items.Objects[comboCampo.ItemIndex]))
                       .AppendLine(' LIKE ' + QuotedStr('%' + edtValor.Text + '%') + ' AND ')
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA');
            if (Tabela = 'CLIENTE') then
              wStrBuilder.AppendLine(' AND IN_SITUACAO = ' + QuotedStr('A'));
      end;

      1 : begin
            wStrBuilder.AppendLine('  WHERE ' + String(comboCampo.Items.Objects[comboCampo.ItemIndex]))
                       .AppendLine(' LIKE ' + QuotedStr(edtValor.Text + '%')  + ' AND ')
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA');
      end;
    end;
    FDDUsuario.Connection := DMConexao.FDConexao;
    if not FDDUsuario.Connection.InTransaction then
      FDDUsuario.Connection.StartTransaction;
    FDDUsuario.SQL.Clear;
    FDDUsuario.SQL.Text   := wStrBuilder.ToString;
    try
      FDDUsuario.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
      FDDUsuario.Open;
      FDDUsuario.Connection.Commit;
      edtValor.Clear;
      edtValor.SetFocus;
    except
      on e : exception do
      begin
        FDDUsuario.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
  end;
end;

procedure TFrmUsuario.dtsUsuarioStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsUsuario);
end;

procedure TFrmUsuario.FDDUsuarioAfterEdit(DataSet: TDataSet);
begin
  FDDUsuarioDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDUsuario.Connection));
  FDDUsuarioCO_USUARIOX.AsInteger    := TParametro.co_usuario;
end;

procedure TFrmUsuario.FDDUsuarioAfterPost(DataSet: TDataSet);
var
  wFDQuery : TFDQuery;
begin
  if not (DataSet.State in [dsInsert]) then
    Exit;
  wFDQuery            := TFDQuery.Create(nil);
  wFDQuery.Connection := DMConexao.FDConexao;
  try
    wFDQuery.SQL.Text := 'create user ' + FDDUsuarioNM_LOGIN.Text + ' password ' +
                          QuotedStr(wSenha) + ' grant admin role using plugin Srp;';
    try
      if not wFDQuery.Connection.InTransaction then
        wFDQuery.Connection.StartTransaction;
      wFDQuery.ExecSQL;
      wFDQuery.Connection.Commit;
    except
      on e : Exception do
      begin
        wFDQuery.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wFDQuery);
  end;
end;

procedure TFrmUsuario.FDDUsuarioBeforePost(DataSet: TDataSet);
var
  aListaErros : TStrings;
begin
  aListaErros := aFactory.ValidaCamposObrigatorios(DataSet);
  try
    if Trim(aListaErros.Text) <> '' then
      raise Exception.Create('Campos de preenchimento obrigatório.' +#13+#13+aListaErros.Text);
  finally
    FreeAndNil(aListaErros);
  end;
end;

procedure TFrmUsuario.FDDUsuarioIN_LIBERADOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 'True' then
    Text := 'Liberado'
  else
    Text := 'Bloqueado';
end;

procedure TFrmUsuario.FDDUsuarioNewRecord(DataSet: TDataSet);
begin
  FDDUsuarioCO_EMPRESA.AsInteger := TParametro.co_empresa;
  FDDUsuarioCO_USUARIOX.AsInteger := TParametro.co_usuario;
end;

procedure TFrmUsuario.FDDUsuarioNM_LOGINValidate(Sender: TField);
var
  aFDQuery : TFDQuery;
  aStrBuilder : TStringBuilder;
begin
  if String(Sender.Text).IsEmpty then
  begin
    Application.MessageBox('Informe o login do usuário', 'Atenção', MB_OK+MB_ICONWARNING);
    Sender.FocusControl;
    Abort;
  end else if String(Sender.Text).Length < 6 then
  begin
    Application.MessageBox('O Login do usuário deve ser composto de pelo menos 6 caracteres, por favor corrija', 'Atenção', MB_OK+MB_ICONWARNING);
    Sender.FocusControl;
    Abort;
  end;

  aFDQuery            := TFDQuery.Create(nil);
  aFDQuery.Connection := DMConexao.FDConexao;
  aStrBuilder         := TStringBuilder.Create;
  try
    aStrBuilder.AppendLine('SELECT NM_LOGIN               ')
               .AppendLine('  FROM UC_USUARIO             ')
               .AppendLine('  WHERE NM_LOGIN = :NM_LOGIN; ');

    aFDQuery.SQL.Text := aStrBuilder.ToString;
    aFDQuery.ParamByName('NM_LOGIN').AsString := Sender.Text.Trim;
    aFDQuery.Open;
    if not aFDQuery.FieldByName('NM_LOGIN').IsNull then
    begin
      Application.MessageBox('Já existe um usuário cadastro com o Login informado, por favor corrija', 'Atenção', MB_OK+MB_ICONWARNING);
    Sender.FocusControl;
    Abort;
    end;
  finally
    FreeAndNil(aFDQuery);
    FreeAndNil(aStrBuilder);
  end;
end;

procedure TFrmUsuario.FDDUsuarioNM_USUARIOValidate(Sender: TField);
var
  wStrList : TStringList;
begin
  wStrList := TStringList.Create;
  try
    wStrList.Delimiter := ' ';
    wStrList.DelimitedText := Sender.Text.Trim;
    if wStrList.Count < 2 then
    begin
      Application.MessageBox('Informe o nome completo do usuário', 'Atenção', MB_OK+MB_ICONWARNING);
      FDDUsuarioNM_USUARIO.FocusControl;
      Abort;
    end;
    FDDUsuarioNM_LOGIN.Text := aFactory.SugerirNomeUser(Sender.Text);
  finally
    FreeAndNil(wStrList);
  end;
end;

procedure TFrmUsuario.FDDUsuarioTX_EMAILValidate(Sender: TField);
begin
  if not aFactory.ValidarEmail(Sender.Text) then
  begin
    Application.MessageBox('O endereço de e-mail informado não é válido, verifique.', 'Atenção', MB_OK+MB_ICONWARNING);
    Sender.FocusControl;
    Abort;
  end;
end;

procedure TFrmUsuario.FormCreate(Sender: TObject);
begin
  comboCondicao.ItemIndex         := 0;
  btnNovo.Left                    := Integer(tNovo);
  btnEditar.Left                  := Integer(tEditar);
  btnExcluir.Left                 := Integer(tExcluir);
  btnGravar.Left                  := Integer(tGravar);
  btnCancelar.Left                := Integer(tCancelar);
//  btnAlternar.Left                := 285;//Integer(tAlteranr);
  btnNovo.Brush.Color             := $00FE6F2C;
  btnNovo.BrushDown.Color         := btnNovo.Brush.Color;
  btnNovo.BrushFocused.Color      := btnNovo.Brush.Color;
  btnNovo.BrushDisabled.Color     := btnNovo.Brush.Color;
  btnEditar.Brush.Color           := $0068625A;
  btnEditar.BrushDown.Color       := btnEditar.Brush.Color;
  btnEditar.BrushFocused.Color    := btnEditar.Brush.Color;
  btnEditar.BrushDisabled.Color   := btnEditar.Brush.Color;
  btnExcluir.Brush.Color          := $003626C6;
  btnExcluir.BrushDown.Color      := btnExcluir.Brush.Color;
  btnExcluir.BrushFocused.Color   := btnExcluir.Brush.Color;
  btnExcluir.BrushDisabled.Color  := btnExcluir.Brush.Color;
  btnGravar.Brush.Color           := $00388A22;
  btnGravar.BrushDown.Color       := btnGravar.Brush.Color;
  btnGravar.BrushFocused.Color    := btnGravar.Brush.Color;
  btnGravar.BrushDisabled.Color   := btnGravar.Brush.Color;
  btnCancelar.Brush.Color         := $000FACDE;
  btnCancelar.BrushDown.Color     := btnCancelar.Brush.Color;
  btnCancelar.BrushFocused.Color  := btnCancelar.Brush.Color;
  btnCancelar.BrushDisabled.Color := btnCancelar.Brush.Color;
  btnFechar.Brush.Color           := $00978420;
  btnFechar.BrushDown.Color       := btnFechar.Brush.Color;
  btnFechar.BrushFocused.Color    := btnFechar.Brush.Color;
  btnFechar.BrushDisabled.Color   := btnFechar.Brush.Color;
  btnAlternar.Brush.Color         := $00E5E0DA;
  btnAlternar.BrushDown.Color     := btnAlternar.Brush.Color;
  btnAlternar.BrushFocused.Color  := btnAlternar.Brush.Color;
  btnAlternar.BrushDisabled.Color := btnAlternar.Brush.Color;
  aFactory                        := TFactory.Create;
  aPersistence                    := TPersistence.Create;
end;

procedure TFrmUsuario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
  FreeAndNil(FCamposPesquisa);
end;

procedure TFrmUsuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmUsuario.FormShow(Sender: TObject);
begin
  aFactory.ArredondarCantosControle(Self);
  pcPrincipal.ActivePage := tabConsulta;
  pnlTitulo.Caption      := Self.Caption;
  pcPrincipalChange(Sender);
  AdicionarCamposPesquisa;
  FDQPerfil.Close;
  FDQPerfil.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
  FDQPerfil.Open;
  FDMSituacao.Open;
end;

procedure TFrmUsuario.GridDblClick(Sender: TObject);
begin
  if FDDUsuario.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmUsuario.pcPrincipalChange(Sender: TObject);
begin
  if pcPrincipal.ActivePageIndex = 0 then
    edtValor.SetFocus
  else
    NM_USUARIO.SetFocus;
  btnAlternar.Visible := pcPrincipal.ActivePageIndex = 1;
  btnAlternar.Enabled := pcPrincipal.ActivePageIndex = 1;
end;


procedure TFrmUsuario.SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
begin
  FCamposPesquisa := Value;
end;

procedure TFrmUsuario.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

procedure TFrmUsuario.TX_SENHAExit(Sender: TObject);
var
  aMensagem : String;
begin
  aMensagem := 'Sua senha deve conter no mínimo:       ' + #13 +
               '      8 Caracteres                     ' + #13 +
               '      1 Caracter especial (*, #, $...) ' + #13 +
               '      1 Letra minúscula                ' + #13 +
               '      1 Letra maiúscula                ';
  if not aFactory.StrongPassword(FDDUsuarioTX_SENHA.Text) then
  begin
    Application.MessageBox(PWideChar(aMensagem), 'Atenção', MB_OK+MB_ICONWARNING);
    TX_SENHA.SetFocus;
    Abort;
  end;

  wSenha := InputBox('Redigite a senha', #31'Senha', '');
  if wSenha <> FDDUsuarioTX_SENHA.Text then
  begin
    Application.MessageBox('Os valores da senha e da confirmação não são iguais, por favor corrija', 'Atenção', MB_OK+MB_ICONERROR);
    FDDUsuarioTX_SENHA.FocusControl;
    Abort;
  end;
  FDDUsuarioTX_SENHA.Text := aFactory.GetStrHashSHA512_256(FDDUsuarioTX_SENHA.Text);
end;

end.
