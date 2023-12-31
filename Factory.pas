unit Factory;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.WinInet,
  Winapi.CommCtrl,
  Winapi.ShellAPI,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.Hash,
  System.NetEncoding,
  System.Net.HttpClient,
  System.Generics.Collections,
  System.DateUtils,
  System.RegularExpressions,
  System.Win.Registry,
  System.IOUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ActnMan,
  Vcl.Imaging.Jpeg,
  Vcl.Buttons,
  Vcl.WinXCtrls,
  Vcl.CategoryButtons,
  Vcl.StdCtrls,
  Vcl.ActnList,
  Vcl.ExtCtrls,
  Vcl.ComCtrls;

type

  TFactory = class(TObject)
  private

  public
    function GetDirectoryApp : String;
    function ExtractOnlyFileName(AFileName: String): String;
    procedure GetDosOutput(pCommandLine: string; pMemo : TMemo);
  end;

implementation

{ TFactory }

function TFactory.GetDirectoryApp: String;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TFactory.GetDosOutput(pCommandLine: string; pMemo: TMemo);
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  Handle: Boolean;
  WorkDir : String;
begin
  WorkDir := TPath.GetTempPath;
  SA.nLength              := SizeOf(SA);
  SA.bInheritHandle       := True;
  SA.lpSecurityDescriptor := nil;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    FillChar(SI, SizeOf(SI), 0);
    SI.cb          := SizeOf(TStartupInfo);
    SI.dwFlags     := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    SI.wShowWindow := SW_HIDE;
    SI.hStdInput   := StdOutPipeRead;
    SI.hStdOutput  := StdOutPipeWrite;
    SI.hStdError   := StdOutPipeWrite;
    FillChar(PI, SizeOf(PI), 0);

    Handle := CreateProcess(PChar(nil), PChar('cmd.exe /C ' + pCommandLine), nil, nil, True, 0, nil, PChar(WorkDir), SI, PI);

    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          Application.ProcessMessages;
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            pMemo.Text        := pMemo.Text + String(Buffer);
            pMemo.Perform(EM_LINESCROLL,0,pMemo.Lines.Count);
            Application.ProcessMessages;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;

function TFactory.ExtractOnlyFileName(AFileName: String): String;
var
    wFileName, wExt: String;
begin
    wExt := ExtractFileExt(AFileName);
    wFileName := ExtractFileName(AFileName);
    Result := StringReplace(wFileName, wExt, '', [rfReplaceAll]);
end;

end.
