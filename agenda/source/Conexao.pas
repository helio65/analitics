unit Conexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, PraButtonStyle, System.ImageList, Vcl.ImgList, System.INIFiles, Factory;

type
  TFrmConexao = class(TForm)
    pnlTitulo: TPanel;
    pnlControles: TPanel;
    pnlPrincipal: TPanel;
    Label1: TLabel;
    FileOpen: TFileOpenDialog;
    edtBase: TButtonedEdit;
    edtServidor: TEdit;
    Label2: TLabel;
    edtPorta: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtUsuario: TEdit;
    Label5: TLabel;
    edtSenha: TEdit;
    btnGravar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    ImageList: TImageList;
    OpenDialog: TOpenDialog;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtBaseRightButtonClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    aFactory : TFactory;
  public
    { Public declarations }
  end;

var
  FrmConexao: TFrmConexao;

implementation

{$R *.dfm}

procedure TFrmConexao.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmConexao.btnGravarClick(Sender: TObject);
var
  wIniFile : TIniFile;
begin
  if (String(edtBase.Text).IsEmpty)  or (String(edtServidor.Text).IsEmpty) or
     (String(edtPorta.Text).IsEmpty) or (String(edtUsuario.Text).IsEmpty)  or
     (String(edtSenha.Text).IsEmpty)  then
  begin
    Application.MessageBox('Informe: Servidor, Porta, Base de Dados, Usuário e Senha!', 'Atenção', MB_OK+MB_ICONERROR);
    Abort;
  end;

  wIniFile := TINIFile.Create(ChangeFileExt(ParamStr(0),'')+'.ini');
  try
    wIniFile.WriteString('Dados', 'Servidor', aFactory.Cripto('E', edtServidor.Text, '512'));
    wIniFile.WriteString('Dados', 'Base',     aFactory.Cripto('E', edtBase.Text,     '512'));
    wIniFile.WriteString('Dados', 'Usuario',  aFactory.Cripto('E', edtUsuario.Text,  '512'));
    wIniFile.WriteString('Dados', 'Senha',    aFactory.Cripto('E', edtSenha.Text,    '512'));
    wIniFile.WriteString('Dados', 'Porta',    aFactory.Cripto('E', edtPorta.Text,    '512'));
  finally
    FreeAndNil(wIniFile);
  end;
  Self.Close;
end;

procedure TFrmConexao.edtBaseRightButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    if OpenDialog.FileName <> '' then
      edtBase.Text := OpenDialog.FileName;
  end;
end;

procedure TFrmConexao.FormCreate(Sender: TObject);
begin
  aFactory := TFactory.Create;
end;

procedure TFrmConexao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
end;

procedure TFrmConexao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
