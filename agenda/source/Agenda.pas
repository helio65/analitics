unit Agenda;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.DateUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Samples.Calendar,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Mask,
  Vcl.Menus,
  Data.DB,
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
  Parametros,
  Factory;

type
  TFrmAgenda = class(TForm)
    pnlTitulo: TPanel;
    pnlHoratios: TPanel;
    Panel1: TPanel;
    pnlCalendario: TPanel;
    dbgAgenda: TDBGrid;
    pnlProfissionais: TPanel;
    Calendario: TCalendar;
    pnlControles: TPanel;
    btnFechar: TPraButtonStyle;
    FDQProfissional: TFDQuery;
    FDQHabilidades: TFDQuery;
    dtsProfissional: TDataSource;
    dtsHabilidades: TDataSource;
    FDQProfissionalCO_PROFISSIONAL: TIntegerField;
    FDQProfissionalCO_EMPRESA: TIntegerField;
    FDQProfissionalNM_PROFISSIONAL: TStringField;
    FDQAgenda: TFDQuery;
    dtsAgenda: TDataSource;
    Panel2: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid3: TDBGrid;
    btnMesAnterior: TPraButtonStyle;
    btnProximoMes: TPraButtonStyle;
    edtData: TMaskEdit;
    edtPesquisaProfissional: TEdit;
    PraButtonStyle1: TPraButtonStyle;
    chkDataCorrente: TCheckBox;
    lblCurrentDate: TLabel;
    popUpAgenda: TPopupMenu;
    Cancelaragendamento1: TMenuItem;
    ransferiragendamento: TMenuItem;
    Liberarmarcao1: TMenuItem;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Agendar1: TMenuItem;
    lblMes: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure CalendarioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDQProfissionalAfterScroll(DataSet: TDataSet);
    procedure edtPesquisaProfissionalChange(Sender: TObject);
    procedure btnMesAnteriorClick(Sender: TObject);
    procedure btnProximoMesClick(Sender: TObject);
    procedure PraButtonStyle1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkDataCorrenteClick(Sender: TObject);
    procedure dbgAgendaDblClick(Sender: TObject);
    procedure Cancelaragendamento1Click(Sender: TObject);
    procedure dbgAgendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Liberarmarcao1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ransferiragendamentoClick(Sender: TObject);
    procedure Agendar1Click(Sender: TObject);
  private
    { Private declarations }
    aFactory : TFactory;
    Hoje : TDateTime;
    procedure GetAgenda(const co_profissional, co_empresa : Integer; data : TDateTime);
    procedure CurrentMonth(const aDate : TDateTime);
  public
    { Public declarations }
  end;

var
  FrmAgenda: TFrmAgenda;

implementation

{$R *.dfm}

uses
  uDMConexao, Agendamento, CancelarAgendamento, TransferirAgendamento;

procedure TFrmAgenda.Agendar1Click(Sender: TObject);
begin
  if not FDQAgenda.IsEmpty then
  begin
    if FDQAgenda.FieldByName('CO_SERVICO').IsNull then
    begin
      FrmAgendamento                      := TFrmAgendamento.Create(nil);
      FrmAgendamento.edtData.Text         := FDQAgenda.FieldByName('DT_AGENDA').AsString;
      FrmAgendamento.edtHorario.Text      := FDQAgenda.FieldByName('TI_HORARIO').AsString;
      FrmAgendamento.edtProfissional.Text := FDQProfissional.FieldByName('NM_PROFISSIONAL').AsString;
      FrmAgendamento.co_profissional      := FDQProfissional.FieldByName('CO_PROFISSIONAL').AsInteger;
      FrmAgendamento.co_agenda            := FDQAgenda.FieldByName('CO_AGENDA').AsInteger;
      FrmAgendamento.pconnection          := TFDConnection(FDQProfissional.Connection);
      FrmAgendamento.ShowModal;
      FreeAndNil(FrmAgendamento);
      FDQAgenda.Refresh;
    end else begin
      Application.MessageBox('Este horário já está agendado, para transferir, cancelar ou liberar o mesmo utilize o menu PopUp', 'Atenção', MB_OK+MB_ICONWARNING);
    end;
  end;
end;

procedure TFrmAgenda.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmAgenda.btnMesAnteriorClick(Sender: TObject);
begin
  Calendario.PrevMonth;
  chkDataCorrente.Checked := False;
end;

procedure TFrmAgenda.btnProximoMesClick(Sender: TObject);
begin
  Calendario.NextMonth;
  chkDataCorrente.Checked := False;
end;

procedure TFrmAgenda.CalendarioChange(Sender: TObject);
begin
  pnlTitulo.Caption := '  Agenda do dia: ' + DateToStr(Calendario.CalendarDate) +
                       ' Profissional: ' + FDQProfissionalNM_PROFISSIONAL.AsString;
  GetAgenda(FDQProfissionalCO_PROFISSIONAL.AsInteger, FDQProfissionalCO_EMPRESA.AsInteger, Calendario.CalendarDate);
  edtData.Text := DateToStr(Calendario.CalendarDate);
  CurrentMonth(Calendario.CalendarDate);
  if Calendario.CalendarDate <> Hoje then
    chkDataCorrente.Checked := False
  else
    chkDataCorrente.Checked := True;
end;

procedure TFrmAgenda.Cancelaragendamento1Click(Sender: TObject);
begin
  if not FDQAgenda.IsEmpty then
  begin
    if not FDQAgenda.FieldByName('CO_SERVICO').IsNull then
    begin
      FrmCancelarAgendamento             := TFrmCancelarAgendamento.Create(nil);
      FrmCancelarAgendamento.pconnection := TFDConnection(FDQProfissional.Connection);
      FrmCancelarAgendamento.co_agenda   := FDQAgenda.FieldByName('CO_AGENDA').AsInteger;
      FrmCancelarAgendamento.ShowModal;
      FreeAndNil(FrmCancelarAgendamento);
      FDQAgenda.Refresh;
    end;
  end;
end;

procedure TFrmAgenda.chkDataCorrenteClick(Sender: TObject);
begin
  Calendario.UseCurrentDate := chkDataCorrente.Checked;
  CalendarioChange(Sender);
end;

procedure TFrmAgenda.CurrentMonth(const aDate: TDateTime);
begin
  case MonthOf(aDate) of
    MonthJanuary   : lblMes.Caption := 'J'+#13+'a'+#13+'n'+#13+'e'+#13+'i'+#13+'r'+#13+'o';
    MonthFebruary  : lblMes.Caption := 'F'+#13+'e'+#13+'v'+#13+'e'+#13+'r'+#13+'e'+#13+'r'+#13+'o';
    MonthMarch     : lblMes.Caption := 'M'+#13+'a'+#13+'r'+#13+'ç'+#13+'o';
    MonthApril     : lblMes.Caption := 'A'+#13+'b'+#13+'r'+#13+'i'+#13+'l';
    MonthMay       : lblMes.Caption := 'M'+#13+'a'+#13+'i'+#13+'o';
    MonthJune      : lblMes.Caption := 'J'+#13+'u'+#13+'n'+#13+'h'+#13+'o';
    MonthJuly      : lblMes.Caption := 'J'+#13+'u'+#13+'l'+#13+'h'+#13+'o';
    MonthAugust    : lblMes.Caption := 'A'+#13+'g'+#13+'o'+#13+'s'+#13+'t'+#13+'o';
    MonthSeptember : lblMes.Caption := 'S'+#13+'e'+#13+'t'+#13+'e'+#13+'m'+#13+'b'+#13+'r'+#13+'o';
    MonthOctober   : lblMes.Caption := 'O'+#13+'u'+#13+'t'+#13+'u'+#13+'b'+#13+'r'+#13+'o';
    MonthNovember  : lblMes.Caption := 'N'+#13+'o'+#13+'v'+#13+'e'+#13+'m'+#13+'b'+#13+'r'+#13+'o';
    MonthDecember  : lblMes.Caption := 'D'+#13+'e'+#13+'z'+#13+'e'+#13+'b'+#13+'r'+#13+'o';
  end;
end;

procedure TFrmAgenda.dbgAgendaDblClick(Sender: TObject);
begin
  Agendar1Click(Sender);
end;

procedure TFrmAgenda.dbgAgendaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if FDQAgenda.FieldByName('IN_STATUS').AsInteger = 2 then
  begin
    dbgAgenda.Canvas.Brush.Color := clGreen;
    dbgAgenda.Canvas.Font.Color  := clWhite;
    dbgAgenda.Canvas.Font.Style  := [fsBold];
  end
  else if FDQAgenda.FieldByName('IN_STATUS').AsInteger = 3 then
  begin
    dbgAgenda.Canvas.Brush.Color := clRed;
    dbgAgenda.Canvas.Font.Color  := clWhite;
    dbgAgenda.Canvas.Font.Style  := [fsBold];
  end;
  dbgAgenda.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmAgenda.edtPesquisaProfissionalChange(Sender: TObject);
begin
  FDQProfissional.Filtered := False;
  FDQProfissional.FilterOptions := [foCaseInsensitive];
  FDQProfissional.Filter   := 'NM_PROFISSIONAL LIKE ' + QuotedStr('%'+ edtPesquisaProfissional.Text + '%');
  FDQProfissional.Filtered := True;
end;

procedure TFrmAgenda.FDQProfissionalAfterScroll(DataSet: TDataSet);
begin
  FDQHabilidades.Close;
  FDQHabilidades.ParamByName('CO_EMPRESA').AsInteger      := FDQProfissionalCO_EMPRESA.AsInteger;
  FDQHabilidades.ParamByName('CO_PROFISSIONAL').AsInteger := FDQProfissionalCO_PROFISSIONAL.AsInteger;
  FDQHabilidades.Open;
  CalendarioChange(Self);
end;

procedure TFrmAgenda.FormCreate(Sender: TObject);
begin
  btnFechar.Brush.Color         := $00978420;
  btnFechar.BrushDown.Color     := btnFechar.Brush.Color;
  btnFechar.BrushFocused.Color  := btnFechar.Brush.Color;
  btnFechar.BrushDisabled.Color := btnFechar.Brush.Color;
  aFactory                      := TFactory.Create;
  lblCurrentDate.Caption        := 'H'+#13+'o'+#13+'j'+#13+'e';
  Hoje                          := Calendario.CalendarDate;
  CurrentMonth(Hoje);
end;

procedure TFrmAgenda.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
end;

procedure TFrmAgenda.FormShow(Sender: TObject);
begin
//  aFactory.ArredondarCantosControle(Self);
  FDQProfissional.Close;
  FDQProfissional.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
  FDQProfissional.Open;
  FDQProfissional.First;
  CalendarioChange(Sender);
end;

procedure TFrmAgenda.GetAgenda(const co_profissional, co_empresa: Integer; data : TDateTime);
begin
  FDQAgenda.Close;
  FDQAgenda.ParamByName('CO_EMPRESA').AsInteger      := co_empresa;
  FDQAgenda.ParamByName('CO_PROFISSIONAL').AsInteger := co_profissional;
  FDQAgenda.ParamByName('DT_AGENDA').AsDate          := data;
  FDQAgenda.Open;
end;

procedure TFrmAgenda.Liberarmarcao1Click(Sender: TObject);
var
  wFDQuery : TFDQuery;
  wStrBuilder : TStringBuilder;
  wSucesso : Boolean;
begin
  if not FDQAgenda.IsEmpty then
  begin
    if FDQAgenda.FieldByName('IN_STATUS').AsInteger = 2 then //O horário só pode ser liberado se estiver agendado.
    begin
      if Application.MessageBox('Confirma a liberação deste horário?', 'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION) = IDYES then
      begin
        wFDQuery            := TFDQuery.Create(nil);
        wFDQuery.Connection := FDQAgenda.Connection;
        wStrBuilder         := TStringBuilder.Create;
        try
          wStrBuilder.AppendLine('UPDATE AGENDA                      ')
                     .AppendLine('  SET CO_SERVICO   = NULL,         ')
                     .AppendLine('      IN_STATUS    = 1,            ')
                     .AppendLine('      OBSERVACOES  = NULL,         ')
                     .AppendLine('      CO_USUARIO   = :CO_USUARIO,  ')
                     .AppendLine('      DT_ALTERACAO = :DT_ALTERACAO ')
                     .AppendLine('  WHERE CO_AGENDA = :CO_AGENDA;    ');

          wFDQuery.SQL.Text := wStrBuilder.ToString;
          wFDQuery.ParamByName('CO_USUARIO').AsInteger    := TParametro.co_usuario;
          wFDQuery.ParamByName('DT_ALTERACAO').AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDQAgenda.Connection));
          wFDQuery.ParamByName('CO_AGENDA').AsInteger     := FDQAgenda.FieldByName('CO_AGENDA').AsInteger;
          try
            wFDQuery.Connection.StartTransaction;
            wFDQuery.ExecSQL;
            wFDQuery.Connection.Commit;
            wSucesso := True;
          except
            on e : exception do
            begin
              wFDQuery.Connection.Rollback;
              raise Exception.Create(e.Message);
            end;
          end;
        finally
          FreeAndNil(wFDQuery);
          FreeAndNil(wStrBuilder);
        end;
        if wSucesso then
        begin
          Application.MessageBox('Horário liberado com sucesso.', 'Atenção', MB_OK+MB_ICONINFORMATION);
        end;
        FDQAgenda.Refresh;
      end;
    end;
  end;
end;

procedure TFrmAgenda.PraButtonStyle1Click(Sender: TObject);
begin
  Calendario.CalendarDate := StrToDate(edtData.Text);
  chkDataCorrente.Checked := False;
end;

procedure TFrmAgenda.ransferiragendamentoClick(Sender: TObject);
begin
  if not FDQAgenda.IsEmpty then
  begin
    if FDQAgenda.FieldByName('IN_STATUS').AsInteger = 2 then
    begin
      FrmTransferirAgendamento                 := TFrmTransferirAgendamento.Create(nil);
      FrmTransferirAgendamento.co_agenda       := FDQAgenda.FieldByName('CO_AGENDA').AsInteger;
      FrmTransferirAgendamento.co_profissional := FDQProfissional.FieldByName('CO_PROFISSIONAL').AsInteger;
      FrmTransferirAgendamento.co_cliente      := FDQAgenda.FieldByName('CO_CLIENTE').AsInteger;
      FrmTransferirAgendamento.co_servico      := FDQAgenda.FieldByName('CO_SERVICO').AsInteger;
      FrmTransferirAgendamento.pConnection     := TFDConnection(FDQAgenda.Connection);
      FrmTransferirAgendamento.edtData.Text    := edtData.Text;
      FrmTransferirAgendamento.edtHorario.Text := FDQAgenda.FieldByName('TI_HORARIO').AsString;
      FrmTransferirAgendamento.ShowModal;
      FreeAndNil(FrmTransferirAgendamento);
      FDQAgenda.Refresh;
    end;
  end;
end;

end.
