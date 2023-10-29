unit Empresa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Generics.Collections,
  System.RegularExpressions,
  System.JSON,
  System.JSON.Types,
  System.JSON.Writers,
  System.JSON.Builders,
  System.JSON.Readers,
  System.UITypes,
  Rest.JSON,
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
  Vcl.DBCtrls,
  Vcl.Mask,
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
  FireDAC.Stan.StorageBin,
  PraButtonStyle,
  Factory,
  Parametros,
  Persistence,
  CamposPesquisa,
  DadosCep;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmEmpresa = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    dtsEmpresa: TDataSource;
    Panel1: TPanel;
    pcPrincipal: TPageControl;
    tabConsulta: TTabSheet;
    Panel2: TPanel;
    Label1Campo: TLabel;
    LabelCondicao: TLabel;
    LabelValor: TLabel;
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
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    CO_EMPRESA: TDBEdit;
    NU_CNPJ: TDBEdit;
    NM_EMPRESA: TDBEdit;
    NM_FANTASIA: TDBEdit;
    NU_CEP: TDBEdit;
    TX_LOGRADOURO: TDBEdit;
    NU_LOGRADOURO: TDBEdit;
    TX_BAIRRO: TDBEdit;
    comboCO_CIDADE: TDBLookupComboBox;
    NU_INSC_ESTADUAL: TDBEdit;
    NU_INSC_MUNICIPAL: TDBEdit;
    NU_CELULAR: TDBEdit;
    NU_TELEFONE: TDBEdit;
    TX_EMAIL: TDBEdit;
    TX_COMPLEMENTO: TDBEdit;
    FDDEmpresa: TFDQuery;
    FDDEmpresaCO_EMPRESA: TIntegerField;
    FDDEmpresaCO_CIDADE: TIntegerField;
    FDDEmpresaNM_EMPRESA: TStringField;
    FDDEmpresaNM_FANTASIA: TStringField;
    FDDEmpresaTX_LOGRADOURO: TStringField;
    FDDEmpresaTX_BAIRRO: TStringField;
    FDDEmpresaTX_COMPLEMENTO: TStringField;
    FDDEmpresaNU_CEP: TStringField;
    FDDEmpresaNU_LOGRADOURO: TIntegerField;
    FDDEmpresaNU_TELEFONE: TStringField;
    FDDEmpresaNU_CELULAR: TStringField;
    FDDEmpresaTX_EMAIL: TStringField;
    FDDEmpresaNU_CNPJ: TStringField;
    FDDEmpresaNU_INSC_ESTADUAL: TStringField;
    FDDEmpresaNU_INSC_MUNICIPAL: TStringField;
    FDDEmpresaIN_SITUACAO: TStringField;
    FDDEmpresaCO_USUARIO: TIntegerField;
    FDDEmpresaDT_ALTERACAO: TSQLTimeStampField;
    FDQCidade: TFDQuery;
    dtsCidade: TDataSource;
    CO_CIDADE: TDBEdit;
    FDMSituacao: TFDMemTable;
    FDMSituacaoCO_SITUACAO: TStringField;
    FDMSituacaoNM_SITUACAO: TStringField;
    comboIN_SITUACAO: TDBLookupComboBox;
    dtsSitucao: TDataSource;
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtsEmpresaStateChange(Sender: TObject);
    procedure FDDEmpresaNU_CEPValidate(Sender: TField);
    procedure FDDEmpresaTX_EMAILValidate(Sender: TField);
    procedure FDDEmpresaNU_CNPJValidate(Sender: TField);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FDDEmpresaNewRecord(DataSet: TDataSet);
    procedure FDDEmpresaAfterEdit(DataSet: TDataSet);
    procedure FDDEmpresaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    aPersistence : TPersistence;
    aFactory     : TFactory;
    FCamposPesquisa: TObjectList<TCamposPesquisa>;
    FTabela: String;
    procedure SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
    procedure SetTabela(const Value: String);
    property CamposPesquisa : TObjectList<TCamposPesquisa> read FCamposPesquisa write SetCamposPesquisa;
    property Tabela : String read FTabela write SetTabela;
    procedure AdicionarCamposPesquisa;
  public
    { Public declarations }
  end;

var
  FrmEmpresa: TFrmEmpresa;

implementation

{$R *.dfm}

uses
  uDMConexao;

procedure TFrmEmpresa.AdicionarCamposPesquisa;
var
  wIndex : Integer;
begin
  try
    wIndex         := 0;
    Tabela         := 'EMPRESA';
    CamposPesquisa := TObjectList<TCamposPesquisa>.Create;
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'CO_EMPRESA';
    CamposPesquisa[wIndex].Descricao := 'Código';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_EMPRESA';
    CamposPesquisa[wIndex].Descricao := 'Nome';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_FANTASIA';
    CamposPesquisa[wIndex].Descricao := 'Fantasia';

    comboCampo.Items.Clear;
    for wIndex := 0 to Pred(CamposPesquisa.Count) do
    begin
      comboCampo.Items.AddObject(String(CamposPesquisa[wIndex].Descricao), TOBject(CamposPesquisa[wIndex].Campo));
    end;
    comboCampo.ItemIndex := 2;
  finally
//    FreeAndNil(CamposPesquisa);
  end;
end;

procedure TFrmEmpresa.btnAlternarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 0;
  pcPrincipalChange(Sender);
end;

procedure TFrmEmpresa.btnCancelarClick(Sender: TObject);
begin
  aPersistence.Cancelar(FDDEmpresa);
end;

procedure TFrmEmpresa.btnEditarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Editar(FDDEmpresa);
end;

procedure TFrmEmpresa.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
    aPersistence.Excluir(FDDEmpresa);
end;

procedure TFrmEmpresa.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmEmpresa.btnGravarClick(Sender: TObject);
begin
  aPersistence.Gravar(FDDEmpresa);
  FDDEmpresa.RefreshRecord();
end;

procedure TFrmEmpresa.btnNovoClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Incluir(FDDEmpresa);
end;

procedure TFrmEmpresa.btnPesquisaClick(Sender: TObject);
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
    FDDEmpresa.Connection := DMConexao.FDConexao;
    if not FDDEmpresa.Connection.InTransaction then
      FDDEmpresa.Connection.StartTransaction;
    FDDEmpresa.SQL.Clear;
    FDDEmpresa.SQL.Text   := wStrBuilder.ToString;
    try
      FDDEmpresa.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
      FDDEmpresa.Open;
      FDDEmpresa.Connection.Commit;
      edtValor.Clear;
      edtValor.SetFocus;
    except
      on e : exception do
      begin
        FDDEmpresa.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
  end;
end;

procedure TFrmEmpresa.dtsEmpresaStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsEmpresa);
  btnAlternar.Enabled := (not(dtsEmpresa.DataSet.State in [dsEdit, dsInsert]));
end;

procedure TFrmEmpresa.FDDEmpresaAfterEdit(DataSet: TDataSet);
begin
  FDDEmpresaCO_USUARIO.AsInteger    := TParametro.co_usuario;
  FDDEmpresaDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDEmpresa.Connection));
end;

procedure TFrmEmpresa.FDDEmpresaBeforePost(DataSet: TDataSet);
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

procedure TFrmEmpresa.FDDEmpresaNewRecord(DataSet: TDataSet);
begin
  FDDEmpresaCO_USUARIO.AsInteger := TParametro.co_usuario;
  FDDEmpresaIN_SITUACAO.AsString := 'A';
end;

procedure TFrmEmpresa.FDDEmpresaNU_CEPValidate(Sender: TField);
var
  DadosCep : TDadosCep;
begin
  if FDDEmpresa.State in [dsEdit, dsInsert] then
  begin
    if Length(Sender.Text) <> 8 then
    begin
      Application.MessageBox('O número do CEP informado não é válido, verifique!', 'Atenção', MB_OK+MB_ICONERROR);
      Sender.FocusControl;
      Exit;
    end;
    if aFactory.InternetState then
    begin
      DadosCep            := TJSON.JsonToObject<TDadosCep>(aFactory.GetCEP(Sender.Text).ToString);
      try
        FDDEmpresaTX_LOGRADOURO.AsString  := DadosCep.logradouro;
        FDDEmpresaTX_BAIRRO.AsString      := DadosCep.bairro;
        FDDEmpresaTX_COMPLEMENTO.AsString := DadosCep.complemento;
        FDDEmpresaCO_CIDADE.AsInteger     := DadosCep.ibge.ToInteger;
      finally
        FreeAndNil(DadosCep);
      end;
      FDDEmpresaNU_LOGRADOURO.FocusControl;
    end;
  end;
end;

procedure TFrmEmpresa.FDDEmpresaNU_CNPJValidate(Sender: TField);
var
  wStrBuilder : TStringBuilder;
  wFDQuery : TFDQuery;
begin
  if FDDEmpresa.State in [dsEdit, dsInsert] then
  begin
    if not Sender.IsNull then
    begin
      if not aFactory.ValidateCNPJ(Sender.Text) then
      begin
        Application.MessageBox('O número do CNPJ informado não é válido, verifique!', 'Atenção', MB_OK+MB_ICONERROR);
        Sender.FocusControl;
        Exit;
      end;
    end;
  end;
  wStrBuilder := TStringBuilder.Create;
  wFDQuery    := TFDQuery.Create(nil);
  wFDQuery.Connection := FDDEmpresa.Connection;
  try
    wStrBuilder.AppendLine('SELECT NU_CNPJ              ')
               .AppendLine('  FROM EMPRESA              ')
               .AppendLine('  WHERE NU_CNPJ = :NU_CNPJ; ');

    wFDQuery.Open(wStrBuilder.ToString, [Sender.Text]);

    if wFDQuery.RecordCount > 0 then
    begin
      raise Exception.Create('Já há uma empresa cadastrada com este número de CNPJ.');
    end;
  finally
    FreeAndNil(wStrBuilder);
    FreeAndNil(wFDQuery);
  end;
end;

procedure TFrmEmpresa.FDDEmpresaTX_EMAILValidate(Sender: TField);
var
  RegEx: TRegEx;
begin
  RegEx.Create('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if not RegEx.Match(Sender.Text).Success then
    raise Exception.Create('O endereço de e-mail informado não é válido, verifique.');
end;

procedure TFrmEmpresa.FormCreate(Sender: TObject);
begin
  comboCondicao.ItemIndex         := 0;
  btnNovo.Left                    := Integer(tNovo);
  btnEditar.Left                  := Integer(tEditar);
  btnExcluir.Left                 := Integer(tExcluir);
  btnGravar.Left                  := Integer(tGravar);
  btnCancelar.Left                := Integer(tCancelar);
  btnAlternar.Left                := 285;//Integer(tAlteranr);
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
  aPersistence                    := TPersistence.Create;
  aFactory                        := TFactory.Create;
end;

procedure TFrmEmpresa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
  FreeAndNil(FCamposPesquisa);
end;

procedure TFrmEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmEmpresa.FormShow(Sender: TObject);
begin
  pcPrincipal.ActivePage := tabConsulta;
  pnlTitulo.Caption      := Self.Caption;
  pcPrincipalChange(Sender);
  FDQCidade.Open;
  FDMSituacao.Open;
  AdicionarCamposPesquisa;
end;

procedure TFrmEmpresa.GridDblClick(Sender: TObject);
begin
  if dtsEmpresa.DataSet.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmEmpresa.pcPrincipalChange(Sender: TObject);
begin
  if pcPrincipal.ActivePageIndex = 0 then
  begin
    btnNovo.Visible     := True;
    btnEditar.Visible   := True;
    btnExcluir.Visible  := True;
    btnGravar.Visible   := False;
    btnCancelar.Visible := False;
    btnAlternar.Visible := False;
    btnEditar.Left      := 59;
    edtValor.SetFocus;
  end else if pcPrincipal.ActivePageIndex = 1 then
  begin
    btnNovo.Visible     := False;
    btnEditar.Visible   := True;
    btnExcluir.Visible  := False;
    btnGravar.Visible   := True;
    btnCancelar.Visible := True;
    btnEditar.Left      := 3;
    btnGravar.Left      := 59;
    btnCancelar.Left    := 118;
    btnAlternar.Visible := True;
  end;
end;


procedure TFrmEmpresa.SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
begin
  FCamposPesquisa := Value;
end;

procedure TFrmEmpresa.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

end.
