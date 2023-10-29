unit uFormBase;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Generics.Collections,
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
  PraButtonStyle;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmBase = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    dtsBase: TDataSource;
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
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBase: TFrmBase;

implementation

{$R *.dfm}

uses
  Factory, uDMConexao, Parametros;

procedure TFrmBase.btnAlternarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 0;
  pcPrincipalChange(Sender);
end;

procedure TFrmBase.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmBase.FormCreate(Sender: TObject);
begin
  comboCondicao.ItemIndex := 0;
  btnNovo.Left            := Integer(tNovo);
  btnEditar.Left          := Integer(tEditar);
  btnExcluir.Left         := Integer(tExcluir);
  btnGravar.Left          := Integer(tGravar);
  btnCancelar.Left        := Integer(tCancelar);
  btnAlternar.Left        := Integer(tAlteranr);
end;

procedure TFrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmBase.FormShow(Sender: TObject);
begin
  pcPrincipal.ActivePage := tabConsulta;
  pnlTitulo.Caption      := Self.Caption;
  pcPrincipalChange(Sender);
end;

procedure TFrmBase.GridDblClick(Sender: TObject);
begin
  if dtsBase.DataSet.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmBase.pcPrincipalChange(Sender: TObject);
begin
  btnAlternar.Visible := pcPrincipal.ActivePageIndex = 1;
  btnAlternar.Enabled := pcPrincipal.ActivePageIndex = 1;
end;


end.
