program SysAgenda;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  System.INIFiles,
  System.Classes,
  System.SysUtils,
  Main in 'Main.pas' {FrmMain},
  Vcl.Themes,
  Vcl.Styles,
  Factory in 'Factory.pas',
  Conexao in 'Conexao.pas' {FrmConexao},
  Parametros in 'Parametros.pas',
  DadosCep in 'DadosCep.pas',
  Persistence in 'Persistence.pas',
  Categoria in 'Categoria.pas' {FrmCategoria},
  CamposPesquisa in 'CamposPesquisa.pas',
  Empresa in 'Empresa.pas' {FrmEmpresa},
  SelecaoEmpresa in 'SelecaoEmpresa.pas' {FrmSelecaoEmpresa},
  Cliente in 'Cliente.pas' {FrmCliente},
  Servico in 'Servico.pas' {FrmServico},
  ProfissionalServico in 'ProfissionalServico.pas' {FrmProfissionalServico},
  Profissional in 'Profissional.pas' {FrmProfissional},
  uDMConexao in 'uDMConexao.pas' {DMConexao: TDataModule},
  Agenda in 'Agenda.pas' {FrmAgenda},
  Feriado in 'Feriado.pas' {FrmFeriado},
  Horario in 'Horario.pas' {FrmHorario},
  GerarAgenda in 'GerarAgenda.pas' {FrmGerarAgenda},
  Agendamento in 'Agendamento.pas' {FrmAgendamento},
  CancelarAgendamento in 'CancelarAgendamento.pas' {FrmCancelarAgendamento},
  TransferirAgendamento in 'TransferirAgendamento.pas' {FrmTransferirAgendamento},
  CancelarAgenda in 'CancelarAgenda.pas' {FrmCancelarAgenda},
  uDMRelatorios in 'uDMRelatorios.pas' {DMRelatorios: TDataModule},
  Login in 'Login.pas' {FrmLogin},
  Perfil in 'Perfil.pas' {FrmPerfil},
  Usuario in 'Usuario.pas' {FrmUsuario},
  AlterarSenha in 'AlterarSenha.pas' {FrmAlterarSenha},
  CopiaSeguranca in 'CopiaSeguranca.pas' {FrmCopiaSeguranca};

{$R *.res}

begin
  if not FileExists(ChangeFileExt(ParamStr(0),'')+'.ini') then
  begin
    FrmConexao := TFrmConexao.Create(nil);
    FrmConexao.ShowModal;
    FreeAndNil(FrmConexao);
  end;
  wIniFile := TINIFile.Create(ChangeFileExt(ParamStr(0),'')+'.ini');
  try
    wServidor := wIniFile.ReadString('Dados', 'Servidor', '');
    wBase     := wIniFile.ReadString('Dados', 'Base',     '');
    wUsuario  := wIniFile.ReadString('Dados', 'Usuario',  '');
    wSenha    := wIniFile.ReadString('Dados', 'Senha',    '');
    wporta    := wIniFile.ReadString('Dados', 'Porta',    '');
  finally
    FreeAndNil(wIniFile);
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown   := True;
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
