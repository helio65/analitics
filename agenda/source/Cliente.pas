unit Cliente;

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
  PraButtonStyle,
  Factory,
  Parametros,
  Persistence,
  CamposPesquisa,
  DadosCep, FireDAC.Stan.StorageBin;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmCliente = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    dtsCliente: TDataSource;
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
    FDDCliente: TFDQuery;
    FDQCidade: TFDQuery;
    dtsCidade: TDataSource;
    FDDClienteCO_CLIENTE: TFDAutoIncField;
    FDDClienteCO_CIDADE: TIntegerField;
    FDDClienteCO_EMPRESA: TIntegerField;
    FDDClienteNM_CLIENTE: TStringField;
    FDDClienteDT_NASCIMENTO: TDateField;
    FDDClienteTX_LOGRADOURO: TStringField;
    FDDClienteTX_BAIRRO: TStringField;
    FDDClienteTX_COMPLEMENTO: TStringField;
    FDDClienteNU_CEP: TStringField;
    FDDClienteNU_LOGRADOURO: TIntegerField;
    FDDClienteNU_TELEFONE: TStringField;
    FDDClienteNU_CELULAR: TStringField;
    FDDClienteTX_EMAIL: TStringField;
    FDDClienteNU_CPF: TStringField;
    FDDClienteIN_SITUACAO: TStringField;
    FDDClienteCO_USUARIO: TIntegerField;
    FDDClienteDT_ALTERACAO: TSQLTimeStampField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    CO_CLIENTE: TDBEdit;
    NU_CPF: TDBEdit;
    NM_CLIENTE: TDBEdit;
    NU_CEP: TDBEdit;
    TX_LOGRADOURO: TDBEdit;
    NU_LOGRADOURO: TDBEdit;
    TX_BAIRRO: TDBEdit;
    comboCO_CIDADE: TDBLookupComboBox;
    NU_CELULAR: TDBEdit;
    NU_TELEFONE: TDBEdit;
    TX_EMAIL: TDBEdit;
    DT_NASCIMENTO: TDBEdit;
    TX_COMPLEMENTO: TDBEdit;
    CO_CIDADE: TDBEdit;
    comboIN_SITUACAO: TDBLookupComboBox;
    dtsSitucao: TDataSource;
    FDMSituacao: TFDMemTable;
    FDMSituacaoCO_SITUACAO: TStringField;
    FDMSituacaoNM_SITUACAO: TStringField;
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FDDClienteNU_CEPValidate(Sender: TField);
    procedure FDDClienteTX_EMAILValidate(Sender: TField);
    procedure FDDClienteNU_CPFValidate(Sender: TField);
    procedure FDDClienteAfterEdit(DataSet: TDataSet);
    procedure FDDClienteNewRecord(DataSet: TDataSet);
    procedure NU_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure dtsClienteStateChange(Sender: TObject);
    procedure FDDClienteBeforePost(DataSet: TDataSet);
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
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses
  uDMConexao;

procedure TFrmCliente.AdicionarCamposPesquisa;
var
  wIndex : Integer;
begin
  try
    wIndex         := 0;
    Tabela         := 'CLIENTE';
    CamposPesquisa := TObjectList<TCamposPesquisa>.Create;
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'CO_CLIENTE';
    CamposPesquisa[wIndex].Descricao := 'Código';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_CLIENTE';
    CamposPesquisa[wIndex].Descricao := 'Nome';

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

procedure TFrmCliente.btnAlternarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 0;
  pcPrincipalChange(Sender);
end;

procedure TFrmCliente.btnCancelarClick(Sender: TObject);
begin
  aPersistence.Cancelar(FDDCliente);
end;

procedure TFrmCliente.btnEditarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Editar(FDDCliente);
end;

procedure TFrmCliente.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
    aPersistence.Excluir(FDDCliente);
end;

procedure TFrmCliente.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmCliente.btnGravarClick(Sender: TObject);
begin
  aPersistence.Gravar(FDDCliente);
  FDDCliente.RefreshRecord();
end;

procedure TFrmCliente.btnNovoClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Incluir(FDDCliente);
end;

procedure TFrmCliente.btnPesquisaClick(Sender: TObject);
var
  wStrBuilder : TStringBuilder;
begin
  if String(edtValor.Text).IsEmpty then
  begin
    Application.MessageBox('Informe o valor a ser pesquisado.', 'Atenção', MB_OK+MB_ICONWARNING);
    edtValor.SetFocus;
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
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA AND ')
                       .AppendLine('  IN_SITUACAO = ' + QuotedStr('A'));
      end;

      1 : begin
            wStrBuilder.AppendLine('  WHERE ' + String(comboCampo.Items.Objects[comboCampo.ItemIndex]))
                       .AppendLine(' LIKE ' + QuotedStr(edtValor.Text + '%')  + ' AND ')
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA AND ')
                       .AppendLine('  IN_SITUACAO = ' + QuotedStr('A'));
      end;
    end;
    FDDCliente.Connection := DMConexao.FDConexao;
    if not FDDCliente.Connection.InTransaction then
      FDDCliente.Connection.StartTransaction;
    FDDCliente.SQL.Clear;
    FDDCliente.SQL.Text   := wStrBuilder.ToString;
    try
      FDDCliente.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
      FDDCliente.Open;
      FDDCliente.Connection.Commit;
      edtValor.Clear;
      edtValor.SetFocus;
    except
      on e : exception do
      begin
        FDDCliente.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
  end;
end;

procedure TFrmCliente.dtsClienteStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsCliente);
end;

procedure TFrmCliente.FDDClienteAfterEdit(DataSet: TDataSet);
begin
  FDDClienteCO_USUARIO.AsInteger    := TParametro.co_usuario;
  FDDClienteDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDCliente.Connection));
end;

procedure TFrmCliente.FDDClienteBeforePost(DataSet: TDataSet);
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

procedure TFrmCliente.FDDClienteNewRecord(DataSet: TDataSet);
begin
  FDDClienteCO_EMPRESA.AsInteger := TParametro.co_empresa;
  FDDClienteCO_USUARIO.AsInteger := TParametro.co_usuario;
  FDDClienteIN_SITUACAO.AsString := 'A';
end;

procedure TFrmCliente.FDDClienteNU_CEPValidate(Sender: TField);
var
  DadosCep : TDadosCep;
begin
  if FDDCliente.State in [dsEdit, dsInsert] then
  begin
    if Length(Sender.Text) <> 8 then
    begin
      Application.MessageBox('O número do CEP informado não é válido, verifique!', 'Atenção', MB_OK+MB_ICONERROR);
      Sender.FocusControl;
      Exit;
    end;
    if aFactory.InternetState then
    begin
      DadosCep := TJSON.JsonToObject<TDadosCep>(aFactory.GetCEP(Sender.Text).ToString);
      try
        FDDClienteTX_LOGRADOURO.AsString  := DadosCep.logradouro;
        FDDClienteTX_BAIRRO.AsString      := DadosCep.bairro;
        FDDClienteTX_COMPLEMENTO.AsString := DadosCep.complemento;
        FDDClienteCO_CIDADE.AsInteger     := DadosCep.ibge.ToInteger;
      finally
        FreeAndNil(DadosCep);
      end;
      FDDClienteNU_LOGRADOURO.FocusControl;
    end;
  end;
end;

procedure TFrmCliente.FDDClienteNU_CPFValidate(Sender: TField);
var
  wStrBuilder : TStringBuilder;
  wFDQuery : TFDQuery;
begin
  if FDDCliente.State in [dsEdit, dsInsert] then
  begin
    if not Sender.IsNull then
    begin
      if not aFactory.ValidateCPF(Sender.Text) then
      begin
        Application.MessageBox('O número do CPF informado não é válido, verifique!', 'Atenção', MB_OK+MB_ICONERROR);
        Sender.FocusControl;
        Exit;
      end;
    end;
  end;
  wStrBuilder := TStringBuilder.Create;
  wFDQuery    := TFDQuery.Create(nil);
  wFDQuery.Connection := FDDCliente.Connection;
  try
    wStrBuilder.AppendLine('SELECT NU_CPF             ')
               .AppendLine('  FROM CLIENTE            ')
               .AppendLine('  WHERE NU_CPF = :NU_CPF; ');

    wFDQuery.Open(wStrBuilder.ToString, [Sender.Text]);

    if wFDQuery.RecordCount > 0 then
    begin
      raise Exception.Create('Já há um cliente cadastrado com este número de CPF.');
    end;
  finally
    FreeAndNil(wStrBuilder);
    FreeAndNil(wFDQuery);
  end;
end;

procedure TFrmCliente.FDDClienteTX_EMAILValidate(Sender: TField);
var
  RegEx: TRegEx;
begin
  RegEx.Create('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if not RegEx.Match(Sender.Text).Success then
    raise Exception.Create('O endereço de e-mail informado não é válido, verifique.');
end;

procedure TFrmCliente.FormCreate(Sender: TObject);
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

procedure TFrmCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
  FreeAndNil(FCamposPesquisa);
end;

procedure TFrmCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  pcPrincipal.ActivePage := tabConsulta;
  edtValor.SetFocus;
  pnlTitulo.Caption      := Self.Caption;
  pcPrincipalChange(Sender);
  AdicionarCamposPesquisa;
  FDQCidade.Open;
  FDMSituacao.Open;
end;

procedure TFrmCliente.GridDblClick(Sender: TObject);
begin
  if dtsCliente.DataSet.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmCliente.NU_CPFKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8])) then
  begin
    Key := #0;
  end;
end;

procedure TFrmCliente.pcPrincipalChange(Sender: TObject);
begin
  btnAlternar.Visible := pcPrincipal.ActivePageIndex = 1;
  btnAlternar.Enabled := pcPrincipal.ActivePageIndex = 1;
end;


procedure TFrmCliente.SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
begin
  FCamposPesquisa := Value;
end;

procedure TFrmCliente.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

end.
