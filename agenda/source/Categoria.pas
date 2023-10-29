unit Categoria;

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
  Vcl.Mask,
  Vcl.DBCtrls,
  Data.DB,
  uDMConexao,
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
  TFrmCategoria = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
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
    CO_CATEGORIA: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    NM_CATEGORIA: TDBEdit;
    FDDCategoria: TFDQuery;
    dtsCategoria: TDataSource;
    FDDCategoriaCO_CATEGORIA: TIntegerField;
    FDDCategoriaCO_EMPRESA: TIntegerField;
    FDDCategoriaNM_CATEGORIA: TStringField;
    FDDCategoriaCO_USUARIO: TIntegerField;
    FDDCategoriaDT_ALTERACAO: TSQLTimeStampField;
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dtsCategoriaStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FDDCategoriaNewRecord(DataSet: TDataSet);
    procedure FDDCategoriaAfterEdit(DataSet: TDataSet);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FDDCategoriaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    aPersistence : TPersistence;
    aFactory : TFactory;
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
  FrmCategoria: TFrmCategoria;

implementation

{$R *.dfm}

procedure TFrmCategoria.AdicionarCamposPesquisa;
var
  wIndex : Integer;
begin
  try
    wIndex         := 0;
    Tabela         := 'CATEGORIA';
    CamposPesquisa := TObjectList<TCamposPesquisa>.Create;
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'CO_CATEGORIA';
    CamposPesquisa[wIndex].Descricao := 'Código';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_CATEGORIA';
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

procedure TFrmCategoria.btnAlternarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 0;
  pcPrincipalChange(Sender);
end;

procedure TFrmCategoria.btnCancelarClick(Sender: TObject);
begin
  aPersistence.Cancelar(FDDCategoria);
end;

procedure TFrmCategoria.btnEditarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Editar(FDDCategoria);
end;

procedure TFrmCategoria.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
    aPersistence.Excluir(FDDCategoria);
end;

procedure TFrmCategoria.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmCategoria.btnGravarClick(Sender: TObject);
begin
  aPersistence.Gravar(FDDCategoria);
  FDDCategoria.RefreshRecord();
end;

procedure TFrmCategoria.btnNovoClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Incluir(FDDCategoria);
end;

procedure TFrmCategoria.btnPesquisaClick(Sender: TObject);
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
    FDDCategoria.Connection := DMConexao.FDConexao;
    if not FDDCategoria.Connection.InTransaction then
      FDDCategoria.Connection.StartTransaction;
    FDDCategoria.SQL.Clear;
    FDDCategoria.SQL.Text   := wStrBuilder.ToString;
    try
      FDDCategoria.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
      FDDCategoria.Open;
      FDDCategoria.Connection.Commit;
      edtValor.Clear;
      edtValor.SetFocus;
    except
      on e : exception do
      begin
        FDDCategoria.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
  end;
end;

procedure TFrmCategoria.dtsCategoriaStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsCategoria);
  btnAlternar.Enabled := not (dtsCategoria.State in [dsEdit, dsInsert]);
  btnAlternar.Visible := btnAlternar.Enabled;
end;

procedure TFrmCategoria.FDDCategoriaAfterEdit(DataSet: TDataSet);
begin
  FDDCategoriaDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDCategoria.Connection));
  FDDCategoriaCO_USUARIO.AsInteger    := TParametro.co_usuario;
end;

procedure TFrmCategoria.FDDCategoriaBeforePost(DataSet: TDataSet);
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

procedure TFrmCategoria.FDDCategoriaNewRecord(DataSet: TDataSet);
begin
  FDDCategoriaCO_EMPRESA.AsInteger := TParametro.co_empresa;
  FDDCategoriaCO_USUARIO.AsInteger := TParametro.co_usuario;
end;

procedure TFrmCategoria.FormCreate(Sender: TObject);
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

procedure TFrmCategoria.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
  FreeAndNil(FCamposPesquisa);
end;

procedure TFrmCategoria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmCategoria.FormShow(Sender: TObject);
begin
  aFactory.ArredondarCantosControle(FrmCategoria);
  pcPrincipal.ActivePage := tabConsulta;
  pnlTitulo.Caption      := Self.Caption;
  pcPrincipalChange(Sender);
  AdicionarCamposPesquisa;
end;

procedure TFrmCategoria.GridDblClick(Sender: TObject);
begin
  if FDDCategoria.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmCategoria.pcPrincipalChange(Sender: TObject);
begin
  btnAlternar.Visible := pcPrincipal.ActivePageIndex = 1;
  btnAlternar.Enabled := pcPrincipal.ActivePageIndex = 1;
end;


procedure TFrmCategoria.SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
begin
  FCamposPesquisa := Value;
end;

procedure TFrmCategoria.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

end.
