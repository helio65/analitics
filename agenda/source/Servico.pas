unit Servico;

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
  Vcl.DBCtrls,
  Vcl.Mask,
  Data.DB,
  PraButtonStyle,
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
  CamposPesquisa;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmServico = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    dtsServico: TDataSource;
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
    lblCO_SERVICO: TLabel;
    lblNM_SERVICO: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CO_SERVICO: TDBEdit;
    NM_SERVICO: TDBEdit;
    CO_CATEGORIA: TDBEdit;
    comboCO_CATEGORIA: TDBLookupComboBox;
    gpgDescricao: TGroupBox;
    TX_DESCRICAO: TDBMemo;
    VL_SERVICO: TDBEdit;
    GroupBox1: TGroupBox;
    TX_OBSERVACAO: TDBRichEdit;
    FDDServico: TFDQuery;
    FDDServicoCO_SERVICO: TFDAutoIncField;
    FDDServicoCO_EMPRESA: TIntegerField;
    FDDServicoCO_CATEGORIA: TIntegerField;
    FDDServicoNM_SERVICO: TStringField;
    FDDServicoTX_DESCRICAO: TStringField;
    FDDServicoVL_SERVICO: TFMTBCDField;
    FDDServicoTX_OBSERVACAO: TStringField;
    FDDServicoCO_USUARIO: TIntegerField;
    FDDServicoDT_ALTERACAO: TSQLTimeStampField;
    FDQCategoria: TFDQuery;
    dtsCategoria: TDataSource;
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dtsServicoStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FDDServicoAfterEdit(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FDDServicoNewRecord(DataSet: TDataSet);
    procedure FDDServicoBeforePost(DataSet: TDataSet);
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
  FrmServico: TFrmServico;

implementation

{$R *.dfm}

uses
  uDMConexao;

procedure TFrmServico.AdicionarCamposPesquisa;
var
  wIndex : Integer;
begin
  try
    wIndex         := 0;
    Tabela         := 'SERVICO';
    CamposPesquisa := TObjectList<TCamposPesquisa>.Create;
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'CO_SERVICO';
    CamposPesquisa[wIndex].Descricao := 'Código';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_SERVICO';
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

procedure TFrmServico.btnAlternarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 0;
  pcPrincipalChange(Sender);
end;

procedure TFrmServico.btnCancelarClick(Sender: TObject);
begin
  aPersistence.Cancelar(FDDServico);
end;

procedure TFrmServico.btnEditarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Editar(FDDServico);
end;

procedure TFrmServico.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
    aPersistence.Excluir(FDDServico);
end;

procedure TFrmServico.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmServico.btnGravarClick(Sender: TObject);
begin
  aPersistence.Gravar(FDDServico);
  FDDServico.RefreshRecord();
end;

procedure TFrmServico.btnNovoClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Incluir(FDDServico);
end;

procedure TFrmServico.btnPesquisaClick(Sender: TObject);
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
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA;');
      end;

      1 : begin
            wStrBuilder.AppendLine('  WHERE ' + String(comboCampo.Items.Objects[comboCampo.ItemIndex]))
                       .AppendLine(' LIKE ' + QuotedStr(edtValor.Text + '%')  + ' AND ')
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA;');
      end;
    end;
    FDDServico.Connection := DMConexao.FDConexao;
    if not FDDServico.Connection.InTransaction then
      FDDServico.Connection.StartTransaction;
    FDDServico.SQL.Clear;
    FDDServico.SQL.Text   := wStrBuilder.ToString;
    try
      FDDServico.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
      FDDServico.Open;
      FDDServico.Connection.Commit;
      edtValor.Clear;
      edtValor.SetFocus;
    except
      on e : exception do
      begin
        FDDServico.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
  end;
end;

procedure TFrmServico.dtsServicoStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsServico);
  btnAlternar.Enabled := (not(dtsServico.DataSet.State in [dsEdit, dsInsert]));
end;

procedure TFrmServico.FDDServicoAfterEdit(DataSet: TDataSet);
begin
  FDDServicoCO_USUARIO.AsInteger    := TParametro.co_usuario;
  FDDServicoDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDServico.Connection));
end;

procedure TFrmServico.FDDServicoBeforePost(DataSet: TDataSet);
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

procedure TFrmServico.FDDServicoNewRecord(DataSet: TDataSet);
begin
  FDDServicoCO_EMPRESA.AsInteger := TParametro.co_empresa;
  FDDServicoCO_USUARIO.AsInteger := TParametro.co_usuario;
end;

procedure TFrmServico.FormCreate(Sender: TObject);
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

procedure TFrmServico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
  FreeAndNil(FCamposPesquisa);
end;

procedure TFrmServico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmServico.FormShow(Sender: TObject);
begin
  pcPrincipal.ActivePage := tabConsulta;
  pnlTitulo.Caption      := Self.Caption;
  pcPrincipalChange(Sender);
  AdicionarCamposPesquisa;
  FDQCategoria.Close;
  FDQCategoria.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
  FDQCategoria.Open;
end;

procedure TFrmServico.GridDblClick(Sender: TObject);
begin
  if dtsServico.DataSet.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmServico.pcPrincipalChange(Sender: TObject);
begin
  btnAlternar.Visible := pcPrincipal.ActivePageIndex = 1;
  btnAlternar.Enabled := pcPrincipal.ActivePageIndex = 1;
end;


procedure TFrmServico.SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
begin
  FCamposPesquisa := Value;
end;

procedure TFrmServico.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

end.
