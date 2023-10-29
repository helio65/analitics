unit Feriado;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  PraButtonStyle,
  Persistence,
  Parametros,
  Factory;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmFeriado = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    btnNovo: TPraButtonStyle;
    btnEditar: TPraButtonStyle;
    btnExcluir: TPraButtonStyle;
    btnGravar: TPraButtonStyle;
    btnCancelar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    DT_FERIADO: TDBEdit;
    Label1: TLabel;
    TX_DESCRICAO: TDBEdit;
    comboIN_TIPO: TDBLookupComboBox;
    Label2: TLabel;
    FDMTipo: TFDMemTable;
    FDMTipoCO_TIPO: TStringField;
    FDMTipoTX_TIPO: TStringField;
    dtsTipo: TDataSource;
    FDDFeriado: TFDQuery;
    dtsFeriado: TDataSource;
    FDDFeriadoDT_FERIADO: TDateField;
    FDDFeriadoCO_EMPRESA: TIntegerField;
    FDDFeriadoTX_DESCRICAO: TStringField;
    FDDFeriadoIN_TIPO: TStringField;
    FDDFeriadoIN_SISTEMA: TStringField;
    FDDFeriadoDT_ALTERACAO: TSQLTimeStampField;
    FDDFeriadoCO_USUARIO: TIntegerField;
    procedure FDDFeriadoAfterEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FDDFeriadoNewRecord(DataSet: TDataSet);
    procedure FDDFeriadoBeforePost(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsFeriadoStateChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    aPersistence : TPersistence;
    aFactory : TFactory;
  public
    { Public declarations }
  end;

var
  FrmFeriado: TFrmFeriado;

implementation

{$R *.dfm}

uses uDMConexao;

procedure TFrmFeriado.btnCancelarClick(Sender: TObject);
begin
  aPersistence.Cancelar(FDDFeriado);
end;

procedure TFrmFeriado.btnEditarClick(Sender: TObject);
begin
  aPersistence.Editar(FDDFeriado);
end;

procedure TFrmFeriado.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
    aPersistence.Excluir(FDDFeriado);
end;

procedure TFrmFeriado.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmFeriado.btnGravarClick(Sender: TObject);
begin
  aPersistence.Gravar(FDDFeriado);
end;

procedure TFrmFeriado.btnNovoClick(Sender: TObject);
begin
  aPersistence.Incluir(FDDFeriado);
end;

procedure TFrmFeriado.dtsFeriadoStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsFeriado);
end;

procedure TFrmFeriado.FDDFeriadoAfterEdit(DataSet: TDataSet);
begin
  FDDFeriadoDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDFeriado.Connection));
  FDDFeriadoCO_USUARIO.AsInteger    := TParametro.co_usuario;
end;

procedure TFrmFeriado.FDDFeriadoBeforePost(DataSet: TDataSet);
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

procedure TFrmFeriado.FDDFeriadoNewRecord(DataSet: TDataSet);
begin
  FDDFeriadoCO_EMPRESA.AsInteger := TParametro.co_empresa;
  FDDFeriadoCO_USUARIO.AsInteger := TParametro.co_usuario;
  FDDFeriadoIN_SISTEMA.AsString  := 'N';
  DT_FERIADO.SetFocus;
end;

procedure TFrmFeriado.FormCreate(Sender: TObject);
begin
  btnNovo.Left                    := Integer(tNovo);
  btnEditar.Left                  := Integer(tEditar);
  btnExcluir.Left                 := Integer(tExcluir);
  btnGravar.Left                  := Integer(tGravar);
  btnCancelar.Left                := Integer(tCancelar);
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
  aPersistence                    := TPersistence.Create;
  aFactory                        := TFactory.Create;
end;

procedure TFrmFeriado.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
end;

procedure TFrmFeriado.FormShow(Sender: TObject);
begin
  FDDFeriado.Close;
  FDDFeriado.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
  FDDFeriado.Open;
end;

end.
