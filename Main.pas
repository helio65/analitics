{ ### Aplicação para analise de estatisticas de base de dados Firebird
  ### Analista/Desenvolvedor: Hélio Oliveira
  ### Data: 15/05/2024
  ### Delphi versão 10.3.3
}

unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList, System.IniFiles,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.FileCtrl, Factory;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtCaminhoFirebird: TButtonedEdit;
    ImageList1: TImageList;
    edtCaminhoBase: TButtonedEdit;
    Panel2: TPanel;
    btnProcessar: TSpeedButton;
    memoResultado: TMemo;
    odCaminhoBase: TOpenDialog;
    GroupBox3: TGroupBox;
    comboAnalisar: TComboBox;
    procedure edtCaminhoFirebirdRightButtonClick(Sender: TObject);
    procedure edtCaminhoBaseRightButtonClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProcessarMouseEnter(Sender: TObject);
    procedure btnProcessarMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    aFactory : TFactory;
    wConfig : TINIFile;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnProcessarClick(Sender: TObject);
var
  wBat : TStringList;
  wPathApp, wNomeArquivo : String;
begin
  if String(edtCaminhoFirebird.Text).IsEmpty  then
  begin
    ShowMessage('Selecione a pasta de instalação do Firebird.');
    edtCaminhoFirebird.SetFocus;
    Exit;
  end;
  if String(edtCaminhoBase.Text).IsEmpty  then
  begin
    ShowMessage('Selecione a base de dados a ser analisada.');
    edtCaminhoBase.SetFocus;
    Exit;
  end;

  wPathApp := Self.aFactory.GetDirectoryApp;
  wBat := TStringList.Create;
  memoResultado.Lines.Clear;
  try
    wBat.Add('@echo off');
    wBat.Add('set path=' + edtCaminhoFirebird.Text);
    wBat.Add('gstat ' + Trim(Copy(comboAnalisar.Text, 1, 6)) + ' "' + edtCaminhoBase.Text + '"');

    wBat.SaveToFile(wPathApp + 'Analitics.bat');

    Self.aFactory.GetDosOutput('"'+ wPathApp + 'Analitics.bat"', memoResultado);

    wNomeArquivo := Self.aFactory.ExtractOnlyFileName(ExtractFileName(edtCaminhoBase.Text));

    wNomeArquivo := wNomeArquivo + '_Estatiscas_' + DateTimeToStr(Now).Replace('/', '').Replace(':', '').Replace(' ', '') + '.log';

    memoResultado.Lines.SaveToFile(wPathApp+'Estatisticas_Log\' + wNomeArquivo);

     Self.wConfig := TIniFile.Create(wPathApp + 'Configuracao.ini');
     Self.wConfig.WriteString('Dados', 'FireDir', edtCaminhoFirebird.Text);
     FreeAndNil(wConfig);
  finally
    FreeAndNil(wBat);
    DeleteFile(wPathApp+'Analitics.bat');
  end;
end;

procedure TFrmMain.btnProcessarMouseEnter(Sender: TObject);
begin
  btnProcessar.Font.Color := clBlack;
  Cursor := crHandPoint;
end;

procedure TFrmMain.btnProcessarMouseLeave(Sender: TObject);
begin
  btnProcessar.Font.Color := clWhite;
  Cursor := crDefault;
end;

procedure TFrmMain.edtCaminhoBaseRightButtonClick(Sender: TObject);
begin
  if odCaminhoBase.Execute then
  begin
    if odCaminhoBase.FileName <> '' then
      edtCaminhoBase.Text := odCaminhoBase.FileName;
  end;
end;

procedure TFrmMain.edtCaminhoFirebirdRightButtonClick(Sender: TObject);
var
  wCaminho : String;
begin
  if SelectDirectory('Selecione a pasta', '', wCaminho) then
  begin
    if wCaminho <> '' then
      edtCaminhoFirebird.Text := wCaminho;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  wPathApp : String;
begin
  Self.aFactory := TFactory.Create;
  wPathApp := Self.aFactory.GetDirectoryApp ;
  System.SysUtils.ForceDirectories(wPathApp + 'Estatisticas_Log');

  if not FileExists(wPathApp + 'Configuracao.ini') then
  begin
    Self.wConfig := TIniFile.Create(wPathApp + 'Configuracao.ini');
    Self.wConfig.WriteString('Dados', 'FireDir', '');
    FreeAndNil(wConfig);
  end else begin
    Self.wConfig := TIniFile.Create(wPathApp + 'Configuracao.ini');
    edtCaminhoFirebird.Text := Self.wConfig.ReadString('Dados', 'FireDir', '');
    FreeAndNil(wConfig);
  end;

end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
end;

end.
