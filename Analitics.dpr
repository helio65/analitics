program Analitics;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown   := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
