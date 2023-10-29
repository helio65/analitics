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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFrmBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dtsBase.State in [dsEdit, dsInsert] then
  begin
    if Application.MessageBox('Foram inseridos novos dados ou alterados e ainda não foram salvos. Cancela:', 'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING) = IDYES then
    begin
      dtsBase.DataSet.Cancel;
      CanClose := True;
    end;
  end;
end;

procedure TFrmBase.FormCreate(Sender: TObject);
begin
  comboCondicao.ItemIndex := 0;
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


end.
