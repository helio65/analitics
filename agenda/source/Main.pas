unit Main;

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
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.CategoryButtons,
  Vcl.WinXCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.Buttons,
  Vcl.AppEvnts,
  Vcl.ActnList,
  Vcl.Imaging.jpeg,
  Data.DB,
  System.Actions,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  PraButtonStyle,
  Factory,
  Parametros;

type
  TFrmMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    MenuRaiz: TSplitView;
    AppEvents: TApplicationEvents;
    btnSair: TPraButtonStyle;
    cbMenuItens: TCategoryButtons;
    cbCadastro: TCategoryButtons;
    cbMovimento: TCategoryButtons;
    cbRelatorios: TCategoryButtons;
    cbSeguranca: TCategoryButtons;
    ActionList1: TActionList;
    actEmpresa: TAction;
    actCliente: TAction;
    actProfissional: TAction;
    actServicos: TAction;
    actAgenda: TAction;
    actAlterarSenha: TAction;
    actUsuarios: TAction;
    actPerfil: TAction;
    actBackup: TAction;
    actRestaurarBackup: TAction;
    actCadastro: TAction;
    actMovimento: TAction;
    actSeguranca: TAction;
    actRelatorios: TAction;
    Image5: TImage;
    actCategoria: TAction;
    actFeriado: TAction;
    actHorario: TAction;
    actGerarAgenda: TAction;
    actCancelarAgenda: TAction;
    actRelAgenda: TAction;
    actRelProfissionais: TAction;
    actRelServicos: TAction;
    actRelTabelaHorarios: TAction;
    actMudarUsuario: TAction;
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure AppEventsHint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbMenuItensMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure actCadastroExecute(Sender: TObject);
    procedure actMovimentoExecute(Sender: TObject);
    procedure actSegurancaExecute(Sender: TObject);
    procedure actRelatoriosExecute(Sender: TObject);
    procedure cbCadastroMouseLeave(Sender: TObject);
    procedure cbSegurancaMouseLeave(Sender: TObject);
    procedure cbRelatoriosMouseLeave(Sender: TObject);
    procedure cbMovimentoMouseLeave(Sender: TObject);
    procedure actClienteExecute(Sender: TObject);
    procedure actProfissionalExecute(Sender: TObject);
    procedure actServicosExecute(Sender: TObject);
    procedure actEmpresaExecute(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure actCategoriaExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAgendaExecute(Sender: TObject);
    procedure actFeriadoExecute(Sender: TObject);
    procedure actHorarioExecute(Sender: TObject);
    procedure actGerarAgendaExecute(Sender: TObject);
    procedure actCancelarAgendaExecute(Sender: TObject);
    procedure actRelAgendaExecute(Sender: TObject);
    procedure actRelProfissionaisExecute(Sender: TObject);
    procedure actRelServicosExecute(Sender: TObject);
    procedure actRelTabelaHorariosExecute(Sender: TObject);
    procedure actPerfilExecute(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Panel1MouseEnter(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actMudarUsuarioExecute(Sender: TObject);
    procedure actAlterarSenhaExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actRestaurarBackupExecute(Sender: TObject);
  private
    { Private declarations }
    wRelatorio : String;
    aFactory : TFactory;
    procedure SetSubMenu(AValue: String);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  Categoria, Empresa, SelecaoEmpresa, Cliente, Servico,
  Profissional, uDMConexao, Agenda, Feriado, Horario, GerarAgenda,
  CancelarAgenda, uDMRelatorios, Login, Perfil, Usuario, AlterarSenha,
  CopiaSeguranca;

procedure TFrmMain.actAgendaExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmAgenda) then
    FrmAgenda := TFrmAgenda.Create(nil);
  FrmAgenda.ShowModal;
  FreeAndNil(FrmAgenda);
end;

procedure TFrmMain.actAlterarSenhaExecute(Sender: TObject);
begin
  if not Assigned(FrmAlterarSenha) then
    FrmAlterarSenha := TFrmAlterarSenha.Create(nil);
  FrmAlterarSenha.ShowModal;
  FreeAndNil(FrmAlterarSenha);
end;

procedure TFrmMain.actBackupExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmCopiaSeguranca) then
    FrmCopiaSeguranca := TFrmCopiaSeguranca.Create(nil);
  FrmCopiaSeguranca.Tag := 1;
  FrmCopiaSeguranca.ShowModal;
  FreeAndNil(FrmCopiaSeguranca);
end;

procedure TFrmMain.actCadastroExecute(Sender: TObject);
begin
  SetSubMenu(TAction(Sender).Name);
end;

procedure TFrmMain.actCancelarAgendaExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmCancelarAgenda) then
    FrmCancelarAgenda := TFrmCancelarAgenda.Create(nil);
  FrmCancelarAgenda.ShowModal;
  FreeAndNil(FrmCancelarAgenda);
end;

procedure TFrmMain.actCategoriaExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmCategoria) then
    FrmCategoria := TFrmCategoria.Create(nil);
  FrmCategoria.ShowModal;
  FreeAndNil(FrmCategoria);
end;

procedure TFrmMain.actClienteExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmCliente) then
    FrmCliente := TFrmCliente.Create(nil);
  FrmCliente.ShowModal;
  FreeAndNil(FrmCliente);
end;

procedure TFrmMain.actEmpresaExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmEmpresa) then
    FrmEmpresa := TFrmEmpresa.Create(nil);
  FrmEmpresa.ShowModal;
  FreeAndNil(FrmEmpresa);
end;

procedure TFrmMain.actFeriadoExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmFeriado) then
    FrmFeriado := TFrmFeriado.Create(nil);
  FrmFeriado.ShowModal;
  FreeAndNil(FrmFeriado);
end;

procedure TFrmMain.actGerarAgendaExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmGerarAgenda) then
    FrmGerarAgenda := TFrmGerarAgenda.Create(nil);
  FrmGerarAgenda.ShowModal;
  FreeAndNil(FrmGerarAgenda);
end;

procedure TFrmMain.actHorarioExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmHorario) then
    FrmHorario := TFrmHorario.Create(nil);
  FrmHorario.ShowModal;
  FreeAndNil(FrmHorario);
end;

procedure TFrmMain.actMovimentoExecute(Sender: TObject);
begin
  SetSubMenu(TAction(Sender).Name);
end;

procedure TFrmMain.actMudarUsuarioExecute(Sender: TObject);
begin
  wLoginLogout := False;
  FormActivate(Sender);
end;

procedure TFrmMain.actPerfilExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmPerfil) then
    FrmPerfil := TFrmPerfil.Create(nil);
  FrmPerfil.ShowModal;
  FreeAndNil(FrmPerfil);
end;

procedure TFrmMain.actProfissionalExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmProfissional) then
    FrmProfissional := TFrmProfissional.Create(nil);
  FrmProfissional.ShowModal;
  FreeAndNil(FrmProfissional);
end;

procedure TFrmMain.actRelAgendaExecute(Sender: TObject);
begin
  wRelatorio := ExtractFilePath(ParamStr(0))+'Relatorios\Agenda.fr3';
  if FileExists(wRelatorio) then
  begin
    DMRelatorios.Rep.LoadFromFile(wRelatorio);
    DMRelatorios.Rep.ShowReport;
  end
  else
  begin
    Application.MessageBox('O arquivo de modelo "Agenda.fr3" não está na psata de relatórios.', 'Atenção', MB_OK+MB_ICONWARNING);
    Abort;
  end;
end;

procedure TFrmMain.actRelatoriosExecute(Sender: TObject);
begin
  SetSubMenu(TAction(Sender).Name);
end;

procedure TFrmMain.actRelProfissionaisExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  wRelatorio := ExtractFilePath(ParamStr(0))+'Relatorios\Relação de Profissionais.fr3';
  if FileExists(wRelatorio) then
  begin
    DMRelatorios.Rep.LoadFromFile(wRelatorio);
    DMRelatorios.Rep.ShowReport;
  end
  else
  begin
    Application.MessageBox('O arquivo de modelo "Relação de Profissionais.fr3" não está na psata de relatórios.', 'Atenção', MB_OK+MB_ICONWARNING);
    Abort;
  end;
end;

procedure TFrmMain.actRelServicosExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  wRelatorio := ExtractFilePath(ParamStr(0))+'Relatorios\Tabela de Serviços.fr3';
  if FileExists(wRelatorio) then
  begin
    DMRelatorios.Rep.LoadFromFile(wRelatorio);
    DMRelatorios.Rep.ShowReport;
  end
  else
  begin
    Application.MessageBox('O arquivo de modelo "Tabela de Serviços.fr3" não está na psata de relatórios.', 'Atenção', MB_OK+MB_ICONWARNING);
    Abort;
  end;
end;

procedure TFrmMain.actRelTabelaHorariosExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  wRelatorio := ExtractFilePath(ParamStr(0))+'Relatorios\Tabela de Horarios.fr3';
  if FileExists(wRelatorio) then
  begin
    DMRelatorios.Rep.LoadFromFile(wRelatorio);
    DMRelatorios.Rep.ShowReport;
  end
  else
  begin
    Application.MessageBox('O arquivo de modelo "Tabela de Horarios.fr3" não está na psata de relatórios.', 'Atenção', MB_OK+MB_ICONWARNING);
    Abort;
  end;
end;

procedure TFrmMain.actRestaurarBackupExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmCopiaSeguranca) then
    FrmCopiaSeguranca   := TFrmCopiaSeguranca.Create(nil);
  FrmCopiaSeguranca.Tag := 2;
  FrmCopiaSeguranca.ShowModal;
  FreeAndNil(FrmCopiaSeguranca);
end;

procedure TFrmMain.actSegurancaExecute(Sender: TObject);
begin
  SetSubMenu(TAction(Sender).Name);
end;

procedure TFrmMain.actServicosExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmServico) then
    FrmServico := TFrmServico.Create(nil);
  FrmServico.ShowModal;
  FreeAndNil(FrmServico);
end;

procedure TFrmMain.actUsuariosExecute(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
  if not Assigned(FrmUsuario) then
    FrmUsuario := TFrmUsuario.Create(nil);
  FrmUsuario.ShowModal;
  FreeAndNil(FrmUsuario);
end;

procedure TFrmMain.AppEventsHint(Sender: TObject);
begin
  StatusBar1.Panels[3].Text := Application.Hint;
end;

procedure TFrmMain.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmMain.cbCadastroMouseLeave(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
end;

procedure TFrmMain.cbMenuItensMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  cat : TCategoryButtons;
  item: TButtonItem;
begin
  cat := Sender as TCategoryButtons;

  item := cat.GetButtonAt(X, Y);

  if item <> nil then
  begin
    item.Action.Execute;
//    Caption := item.Caption;
  end;
    {*** Aqui está condição nunca é satisfatoria, mesmo os buttos que são adicionados
     na TCategoryButtons serem do tipo TButtonItem ***}
end;

procedure TFrmMain.cbMovimentoMouseLeave(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self) ;
end;

procedure TFrmMain.cbRelatoriosMouseLeave(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
end;

procedure TFrmMain.cbSegurancaMouseLeave(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
  if not wLoginLogout then
  begin
    FrmLogin := TFrmLogin.Create(nil);
    FrmLogin.ShowModal;
    FreeAndNil(FrmLogin);
    StatusBar1.Panels[2].Text := 'Usuário: ' + TParametro.nm_usuario;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  wStrBuilder : TStringBuilder;
  wFDQuery    : TFDQuery;
begin
  //Cria as catetorias e ações de menu
//  aFactory.SetCategoria(ActionList1, DMConexao.FDConexao); //Cria as catetorias de menu
//  aFactory.SetAcao(ActionList1, DMConexao.FDConexao); //Cria as ações de menu
//  aFactory.SetLoginAdm(DMConexao.FDConexao); //Cria o usuário Administrador do Sistema
  //
  aFactory     := TFactory.Create;
  DMRelatorios := TDMRelatorios.Create(Self);
  wStrBuilder         := TStringBuilder.Create;
  wFDQuery            := TFDQuery.Create(nil);
  wFDQuery.Connection := DMConexao.FDConexao;
  try
    wStrBuilder.AppendLine('SELECT CO_EMPRESA,          ')
		           .AppendLine('       NM_EMPRESA,          ')
               .AppendLine('       NM_FANTASIA          ')
               .AppendLine('  FROM EMPRESA              ')
               .AppendLine('  WHERE IN_SITUACAO = ''A'' ');

    wFDQuery.Open(wStrBuilder.ToString);

    if wFDQuery.RecordCount > 1 then
    begin
      FrmSelecaoEmpresa := TFrmSelecaoEmpresa.Create(nil);
      FrmSelecaoEmpresa.dtsEmpresa.DataSet := wFDQuery;
      FrmSelecaoEmpresa.ShowModal;
      FreeAndNil(FrmSelecaoEmpresa);
    end else begin
      TParametro.co_empresa := wFDQuery.FieldByName('CO_EMPRESA').AsInteger;
      TParametro.nm_empresa := wFDQuery.FieldByName('NM_EMPRESA').AsString;
      TParametro.nm_fantasia := wFDQuery.FieldByName('NM_FANTASIA').AsString;
    end;

  finally
    FreeAndNil(wStrBuilder);
    FreeAndNil(wFDQuery);
  end;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
  FreeAndNil(DMRelatorios);
end;

procedure TFrmMain.FormPaint(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'Empresa: ' + FormatFloat('000', TParametro.co_empresa) + ' - ' + TParametro.nm_empresa;
end;

procedure TFrmMain.Image1MouseEnter(Sender: TObject);
begin
  Image1.Visible := False;
  Image2.Visible := True;
end;

procedure TFrmMain.Image2Click(Sender: TObject);
begin
  MenuRaiz.Opened := not MenuRaiz.Opened;
end;

procedure TFrmMain.Image2MouseLeave(Sender: TObject);
begin
  Image1.Visible := True;
  Image2.Visible := False;
end;

procedure TFrmMain.Image5MouseEnter(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
end;

procedure TFrmMain.Panel1MouseEnter(Sender: TObject);
begin
  aFactory.OcultarSubMenu(Self);
end;

procedure TFrmMain.SetSubMenu(AValue: String);
begin
  if AValue = 'actCadastro' then
  begin

    cbCadastro.Visible   := True;
    cbCadastro.Left      := MenuRaiz.Width - 18;
    cbCadastro.Top       := 46;
    cbMovimento.Visible  := False;
    cbRelatorios.Visible := False;
    cbSeguranca.Visible  := False;

  end else if AValue = 'actMovimento' then
  begin
    cbMovimento.Visible  := True;
    cbMovimento.Left     := MenuRaiz.Width - 18;
    cbMovimento.Top      := 78;
    cbCadastro.Visible   := False;
    cbRelatorios.Visible := False;
    cbSeguranca.Visible  := False;

  end else if AValue = 'actRelatorios' then
  begin
    cbRelatorios.Visible := True;
    cbRelatorios.Left    := MenuRaiz.Width - 18;
    cbRelatorios.Top     := 110;
    cbCadastro.Visible   := False;
    cbMovimento.Visible  := False;
    cbSeguranca.Visible  := False;

  end else if AValue = 'actSeguranca' then
  begin
    cbSeguranca.Visible  := True;
    cbSeguranca.Left     := MenuRaiz.Width - 18;
    cbSeguranca.Top      := 142;
    cbCadastro.Visible   := False;
    cbMovimento.Visible  := False;
    cbRelatorios.Visible := False;
  end;
end;

end.
