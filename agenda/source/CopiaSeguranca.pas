unit CopiaSeguranca;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.IOUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ImgList,
  Vcl.Imaging.pngimage,
  FireDAC.Comp.Client,
  PraButtonStyle,
  Factory,
  Parametros;

type
  TFrmCopiaSeguranca = class(TForm)
    pnlTitulo: TPanel;
    pnlControles: TPanel;
    pnlCenter: TPanel;
    pgcCopiaSeguranca: TPageControl;
    tabBackup: TTabSheet;
    tabRestore: TTabSheet;
    Panel1: TPanel;
    edtFileCopia: TButtonedEdit;
    ImageList1: TImageList;
    pnlBackup: TPanel;
    memoBackup: TMemo;
    pnlRestore: TPanel;
    memoRestore: TMemo;
    btnFechar: TPraButtonStyle;
    btnProcessar: TPraButtonStyle;
    OpenBackup: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure edtFileCopiaRightButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    aFactory : TFactory;
    wNomeArquivo : String;
    wNome7z : String;
//    wDBName : String;
//    wLogFile : String;
//    wDBPath : String;
//    wFileRestore : String;
    wDateTimeNow : String;
    wNomeLog : String;
    procedure SetNomeArquivo;
    function ConnectedUsers: Integer;
  public
    { Public declarations }
  end;

var
  FrmCopiaSeguranca: TFrmCopiaSeguranca;

implementation

{$R *.dfm}

uses
  uDMConexao;

{ TFrmCopiaSeguranca }

procedure TFrmCopiaSeguranca.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmCopiaSeguranca.btnProcessarClick(Sender: TObject);
var
  wBackup : TStringList;
  wHoraInicio, wHoraFim, wDuracao : TTime;
  wOldName, wNewName, wPathApp, wPathFB, wPath7z : String;
  wConnections : Integer;
begin
  btnProcessar.Enabled          := False;
  btnFechar.Enabled             := False;
  DMConexao.FDConexao.Connected := False;
  wPathApp := aFactory.GetDirectoryApp;
  wPathFB  := ExcludeTrailingPathDelimiter(aFactory.GetFirebirdInstallDir);
  wPath7z  := ExcludeTrailingPathDelimiter(aFactory.Get7zipInstallDir);

  case pgcCopiaSeguranca.ActivePageIndex of
    0 : begin //Fazer cópia de segurança
          wBackup := TStringList.Create;
          try
            wHoraInicio := Now;

            wBackup.Add('@echo off');
            wBackup.Add('set path=' + wPathFB + ';' + wPath7z + ';%path%');
            wBackup.Add('gbak.exe -backup -v -l -user ' + DMConexao.FDConexao.Params.UserName + ' -ro RDB$ADMIN -pas ' +
                        DMConexao.FDConexao.Params.Password + ' "'+
                        DMConexao.FDConexao.Params.Values['Server'] +'/' +
                        DMConexao.FDConexao.Params.Values['Port'] + ':' +
                        DMConexao.FDConexao.Params.Values['Database'] + '" "' +
                        StringReplace(edtFileCopia.Text, '.7z', '.fbk', []) + '"');
            wBackup.Add('7z a -t7z "' + ExtractFilePath(edtFileCopia.Text) + ChangeFileExt(ExtractFileName(edtFileCopia.Text), '') + '.7z" "' +
                        StringReplace(edtFileCopia.Text, '.7z', '.fbk', []) + '"');

            wBackup.SaveToFile(wPathApp + 'Backup.bat');

            aFactory.GetDosOutput('"'+ wPathApp + 'Backup.bat"', memoBackup);
            wBackup.Clear;
          finally
            DeleteFile(wNomeArquivo);
            wHoraFim := Now;
            wDuracao := (wHoraFim - wHoraInicio);
            memoBackup.Lines.Add(' ');
            memoBackup.Lines.Add('Cópia de segurança:');
            memoBackup.Lines.Add('     Iniciada as: ' + TimeToStr(wHoraInicio));
            memoBackup.Lines.Add('     Finalizada as: ' + TimeToStr(wHoraFim));
            memoBackup.Lines.Add('');
            memoBackup.Lines.Add('     Duração: ' + TimeToStr(wDuracao));
            memoBackup.Lines.Add('');
            memoBackup.Lines.Add('Cópia de segurança realizada com sucesso!!!!');
            memoBackup.Lines.SaveToFile(wPathApp + 'Log\' + ChangeFileExt(ExtractFileName(edtFileCopia.Text), '') + '.log');
            FreeAndNil(wBackup);
            btnFechar.Enabled    := True;
            btnProcessar.Enabled := True;

            TFile.Delete(StringReplace(edtFileCopia.Text, '.7z', '.fbk', []));
            TFile.Delete(wPathApp + 'Backup.bat');
          end;
        end;
    1 : begin //Restaurar cópia de segurança
//          wT := TStringBuilder.Create;
//          try
//            wHoraInicio := Now;
////            wDBPath      := wServidor + '/' + wPorta + ':' + wDBName.Replace('.FDB', '.NEW');
////            wFileRestore := StringReplace(edtCopiaSeguranca.Text, '.7z', '.fbk', []);
//
//            memoRestore.Lines.Add('');
//            memoRestore.Lines.Add('Aguarde descompactando arquivo.');
//
//            wT.Append('7z e ')
//              .Append('"')
//              .Append(edtFileCopia.Text)
//              .Append('"')
//              .Append(' ')
//              .Append(' -o')
//              .Append('"')
//              .Append(ExtractFilePath(DMConexao.FDConexao.Params.Values['Database']))
//              .Append('"')
//              .Append(' -aoa');
//
//            aFactory.GetDosOutput(wT.ToString, memoRestore);
//
//            memoRestore.Lines.Add('');
//            memoRestore.Lines.Add('Arquivo descompactado com sucesso!');
//            memoRestore.Lines.Add('');
//            memoRestore.Lines.Add('');
//
////            wFileRestore := ExtractFilePath(wDBName) + ExtractFileName(wFileRestore);
//
//            wDateTimeNow := FormatDateTime('DDMMYYYY', Date) + FormatDateTime('hhnnsszzz', Time);
//
////            wOldName := wDBName;
//
////            wNewName := ChangeFileExt(wDBName, ' ') + '_' + wDateTimeNow + '.OLD';
//
////            wDBName := wServidor + '/' + wPorta + ':' + wDBName;
//
//            wT.Clear;
//            wT.Append('gbak.exe ')
//              .Append('-r -v -user ')
//              .Append(DMConexao.FDConexao.Params.UserName)
//              .Append(' -ro RDB$ADMIN')
//              .Append(' -pas ')
//              .Append(DMConexao.FDConexao.Params.Password)
//              .Append(' ')
//              .Append('"')
////              .Append(wFileRestore)
//              .Append('"')
//              .Append(' ')
//              .Append('"')
////              .Append(wDBPath)
//              .Append('"');
//
//            aFactory.GetDosOutput(wT.ToString, memoRestore);
//
//            RenameFile(wOldName, wNewName);
//
//            RenameFile(wOldName.Replace('FDB', 'NEW'), wOldName);
//
//          finally
////            DeleteFile(wFileRestore);
//            wHoraFim := Now;
//            wDuracao := (wHoraFim - wHoraInicio);
//            memoRestore.Lines.Add('');
//            memoRestore.Lines.Add('Restauração: ');
//            memoRestore.Lines.Add('     Iniciada as: ' + TimeToStr(wHoraInicio));
//            memoRestore.Lines.Add('     Finalizada as: ' + TimeToStr(wHoraFim));
//            memoRestore.Lines.Add('');
//            memoRestore.Lines.Add('     Duração: ' + TimeToStr(wDuracao));
//            memoRestore.Lines.Add('');
//            memoRestore.Lines.Add('Cópia de segurança restaurada com sucesso!!!!');
////            memoRestore.Lines.SaveToFile(wFileRestore.Replace('.fbk', '.log').Replace('Bkp', 'Rest') );
//            FreeAndNil(wT);
//            btnFechar.Enabled    := True;
//            btnProcessar.Enabled := True;
//            TFile.Move(PwideChar(ExtractFilePath(Application.ExeName) +
//                       ChangeFileExt(ExtractFileName(edtFileCopia.Text), '') + '.log'),
//                       PWideChar(ExtractFilePath(Application.ExeName) + 'Log\' +
//                       ChangeFileExt(ExtractFileName(edtFileCopia.Text), '') + '.log'));
//            Application.MessageBox('Após a restauração da base da dados, é necessário reiniciar a aplicação.', 'Atençpão', MB_OK+MB_ICONWARNING);
//            Application.Terminate;
//          end;
        end;
  end;
end;

function TFrmCopiaSeguranca.ConnectedUsers: Integer;
var
  aFDQuery : TFDQuery;
  aStrBuilder : TStringBuilder;
begin
  Result              := 0;
  aFDQuery            := TFDQuery.Create(nil);
  aFDQuery.Connection := DMConexao.FDConexao;
  aStrBuilder := TStringBuilder.Create('SELECT COUNT(*) AS CONEXOES             ')
                               .Append('  FROM MON$ATTACHMENTS                  ')
                               .Append('  WHERE MON$REMOTE_PROCESS IS NOT NULL; ');
  try
    aFDQuery.Open(aStrBuilder.ToString);
    Result := aFDQuery.FieldByName('CONEXOES').AsInteger;
  finally
    FreeAndNil(aFDQuery);
    FreeAndNil(aStrBuilder);
  end;
end;

procedure TFrmCopiaSeguranca.edtFileCopiaRightButtonClick(Sender: TObject);
begin
  if OpenBackup.Execute then
  
end;

procedure TFrmCopiaSeguranca.FormCreate(Sender: TObject);
begin
  aFactory := TFactory.Create;
end;

procedure TFrmCopiaSeguranca.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
end;

procedure TFrmCopiaSeguranca.FormShow(Sender: TObject);
var
  aDiretorioBackRest, aFileName  : String;
begin
  aDiretorioBackRest := aFactory.GetDirectoryApp + 'Backup\' +
                        aFactory.GetCurrentYear(DMConexao.FDConexao).ToString + '\';

  aFileName          := 'Bkp_' + ExtractFileName(ChangeFileExt(ParamStr(0), '_')) +
                        FormatDateTime('ddmmyyyyhhnnss',aFactory.GetCurrentTimeStamp(DMConexao.FDConexao)) +
                        '.7z';
  if not DirectoryExists(aDiretorioBackRest) then
    ForceDirectories(aDiretorioBackRest);

  if not DirectoryExists(aFactory.GetDirectoryApp + 'Log\') then
    ForceDirectories(aFactory.GetDirectoryApp + 'Log\');

  case Self.Tag of
    1 : begin //Backup
          pnlTitulo.Caption            := 'Fazer cópia de segurança';
          pgcCopiaSeguranca.ActivePage := tabBackup;
          edtFileCopia.TextHint        := 'Nome do arquivo';
          edtFileCopia.Text            := aDiretorioBackRest + aFileName;
          edtFileCopia.Enabled         := False;
        end;
    2 : begin //Restore
          pnlTitulo.Caption            := 'Restaurar cópia de segurança';
          pgcCopiaSeguranca.ActivePage := tabRestore;
          edtFileCopia.TextHint        := 'Selecione a cópia de segurança a ser restaurada';
          OpenBackup.InitialDir        := aDiretorioBackRest;
        end;
  end;
  if Self.Tag = 1 then
  begin

  end
end;

procedure TFrmCopiaSeguranca.SetNomeArquivo;
begin
  wDateTimeNow := FormatDateTime('DDMMYYY', Date) + FormatDateTime('hhnnsszzz', Time);
  wNomeArquivo := 'Bkp_' + ExtractFileName(ChangeFileExt(Application.ExeName, '')) + '_' + wDateTimeNow + '.fbk';
//  wNomeArquivo := edtLocalBackup.Text + wNomeArquivo;
  wNome7z      := ChangeFileExt(wNomeArquivo, '') + '.7z';
  wNomeLog     := ChangeFileExt(wNome7z, '') + '.log';
  wNomeLog     := wNomeLog.Replace('Backup', 'Log');
end;

end.
