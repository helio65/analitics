unit SelecaoEmpresa;

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
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  PraButtonStyle,
  Data.DB,
  Parametros;

type
  TFrmSelecaoEmpresa = class(TForm)
    pnlBotoes: TPanel;
    btnNovo: TPraButtonStyle;
    btnSelecionar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    comboEmpresa: TDBLookupComboBox;
    Label1: TLabel;
    pnlTitulo: TPanel;
    dtsEmpresa: TDataSource;
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure comboEmpresaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecaoEmpresa: TFrmSelecaoEmpresa;

implementation

{$R *.dfm}

uses Empresa;

procedure TFrmSelecaoEmpresa.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmSelecaoEmpresa.btnNovoClick(Sender: TObject);
begin
  FrmEmpresa := TFrmEmpresa.Create(nil);
  FrmEmpresa.btnNovoClick(Sender);
  FrmEmpresa.ShowModal;
  FreeAndNil(FrmEmpresa);
end;

procedure TFrmSelecaoEmpresa.btnSelecionarClick(Sender: TObject);
begin
  if String(comboEmpresa.Text).IsEmpty then
  begin
    Application.MessageBox('Selecione uma empresa.', 'Atenção', MB_OK+MB_ICONWARNING);
    Abort;
  end;
  TParametro.co_empresa  := comboEmpresa.KeyValue;
  TParametro.nm_empresa  := dtsEmpresa.DataSet.FieldByName('NM_EMPRESA').AsString;
  TParametro.nm_fantasia := dtsEmpresa.DataSet.FieldByName('NM_FANTASIA').AsString;
  TParametro.nm_usuario  := 'Usuário: Hélio Oliveira';
  Self.Close;
end;

procedure TFrmSelecaoEmpresa.comboEmpresaExit(Sender: TObject);
begin
  btnSelecionar.SetFocus;
end;

procedure TFrmSelecaoEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
