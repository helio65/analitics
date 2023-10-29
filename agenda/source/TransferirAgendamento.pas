unit TransferirAgendamento;

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
  vcl.Mask,
  FireDAC.Comp.Client,
  PraButtonStyle,
  Factory,
  Parametros,
  GroupBox.Interpose, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFrmTransferirAgendamento = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    btnProcessar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtData: TMaskEdit;
    edtHorario: TMaskEdit;
    comboServico: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    memObservacoes: TMemo;
    comboProfissional: TDBLookupComboBox;
    Label3: TLabel;
    comboHorarios: TComboBox;
    dtsServico: TDataSource;
    dtsProfissional: TDataSource;
    FDQProfissional: TFDQuery;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FDQProfissionalAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
  private
    Fco_servico: Integer;
    Fco_profissional: Integer;
    wStrBuilder : TStringBuilder;
    wFDQHorarios : TFDQuery;
    wFDQServicos : TFDQuery;
    wFDQuery : TFDQuery;
    aFactory : TFactory;
    FpConnection: TFDConnection;
    Fco_agenda: Integer;
    Fco_cliente: Integer;
    procedure Setco_profissional(const Value: Integer);
    procedure Setco_servico(const Value: Integer);
    procedure GetHorariosDisponiveis(aValue : Integer);
    procedure GetServicos(aValue : Integer);
    procedure SetpConnection(const Value: TFDConnection);
    procedure Setco_agenda(const Value: Integer);
    procedure Setco_cliente(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property co_profissional : Integer read Fco_profissional write Setco_profissional;
    property co_servico : Integer read Fco_servico write Setco_servico;
    property co_agenda : Integer read Fco_agenda write Setco_agenda;
    property co_cliente : Integer read Fco_cliente write Setco_cliente;
    property pConnection : TFDConnection read FpConnection write SetpConnection;
  end;

var
  FrmTransferirAgendamento: TFrmTransferirAgendamento;

implementation

{$R *.dfm}

procedure TFrmTransferirAgendamento.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmTransferirAgendamento.btnProcessarClick(Sender: TObject);
var
  wSucesso : Boolean;
begin
  if comboHorarios.Text = '' then
  begin
    Application.MessageBox('Selecione o horário', 'Atenção', MB_OK+MB_ICONWARNING);
    comboHorarios.SetFocus;
    Abort;
  end else if comboProfissional.Text = '' then
  begin
    Application.MessageBox('Selecione o Profissional', 'Atenção', MB_OK+MB_ICONWARNING);
    comboProfissional.SetFocus;
    Abort;
  end else if comboServico.Text = '' then
  begin
    Application.MessageBox('Selecione o Serviço', 'Atenção', MB_OK+MB_ICONWARNING);
    comboServico.SetFocus;
    Abort;
  end;
  wStrBuilder.Clear;
  wStrBuilder.AppendLine('UPDATE AGENDA                      ')
             .AppendLine('  SET CO_SERVICO   = :CO_SERVICO,  ')
             .AppendLine('      CO_CLIENTE   = :CO_CLIENTE,  ')
             .AppendLine('      IN_STATUS    = :IN_STATUS,   ')
             .AppendLine('      OBSERVACOES  = :OBSERVACOES, ')
             .AppendLine('      CO_USUARIO   = :CO_USUARIO,  ')
             .AppendLine('      DT_ALTERACAO = :DT_ALTERACAO ')
             .AppendLine('  WHERE CO_AGENDA = :CO_AGENDA;    ');

  wFDQuery.SQL.Clear; //Faz o agendamento para o novo horário/Profissional
  wFDQuery.Connection := pConnection;
  wFDQuery.SQL.Text := wStrBuilder.ToString;
  wFDQuery.ParamByName('CO_SERVICO').AsInteger := comboServico.KeyValue;
  wFDQuery.ParamByName('CO_CLIENTE').AsInteger := co_cliente;
  wFDQuery.ParamByName('IN_STATUS').AsInteger  := 2;
  if not String(memObservacoes.Lines.Text).IsEmpty then
    wFDQuery.ParamByName('OBSERVACOES').AsString := memObservacoes.Lines.Text
  else
    wFDQuery.ParamByName('OBSERVACOES').Value := null;
  wFDQuery.ParamByName('CO_USUARIO').AsInteger    := TParametro.co_usuario;
  wFDQuery.ParamByName('DT_ALTERACAO').AsDateTime := aFactory.GetCurrentTimeStamp(pconnection);
  wFDQuery.ParamByName('CO_AGENDA').AsInteger     := Integer(comboHorarios.Items.Objects[comboHorarios.ItemIndex]);
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

  wStrBuilder.Clear; //Libera a marcação anterior
  wStrBuilder.AppendLine('UPDATE AGENDA                      ')
             .AppendLine('  SET CO_SERVICO   = NULL,         ')
             .AppendLine('      CO_CLIENTE   = NULL,         ')
             .AppendLine('      IN_STATUS    = 1,            ')
             .AppendLine('      OBSERVACOES  = NULL,         ')
             .AppendLine('      CO_USUARIO   = :CO_USUARIO,  ')
             .AppendLine('      DT_ALTERACAO = :DT_ALTERACAO ')
             .AppendLine('  WHERE CO_AGENDA = :CO_AGENDA;    ');

  wFDQuery.SQL.Text := wStrBuilder.ToString;
  wFDQuery.ParamByName('CO_USUARIO').AsInteger    := TParametro.co_usuario;
  wFDQuery.ParamByName('DT_ALTERACAO').AsDateTime := aFactory.GetCurrentTimeStamp(pConnection);
  wFDQuery.ParamByName('CO_AGENDA').AsInteger     := co_agenda;
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
  if wSucesso then
    Application.MessageBox('Transferência do agendamento realizado com sucesso!', 'Atenção', MB_OK+MB_ICONINFORMATION);
  btnFecharClick(Sender);
end;

procedure TFrmTransferirAgendamento.FDQProfissionalAfterScroll(DataSet: TDataSet);
begin
  GetHorariosDisponiveis(FDQProfissional.FieldByName('CO_PROFISSIONAL').AsInteger);
  GetServicos(FDQProfissional.FieldByName('CO_PROFISSIONAL').AsInteger);
end;

procedure TFrmTransferirAgendamento.FormCreate(Sender: TObject);
begin
  wStrBuilder         := TStringBuilder.Create;
  wFDQHorarios        := TFDQuery.Create(nil);
  wFDQServicos        := TFDQuery.Create(nil);
  wFDQuery            := TFDQuery.Create(nil);
  aFactory            := TFactory.Create;
end;

procedure TFrmTransferirAgendamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(wStrBuilder);
  FreeAndNil(wFDQHorarios);
  FreeAndNil(wFDQServicos);
  FreeAndNil(wFDQuery);
  FreeAndNil(aFactory);
end;

procedure TFrmTransferirAgendamento.FormShow(Sender: TObject);
begin
  FDQProfissional.Close;
  FDQProfissional.Connection                          := pConnection;
  FDQProfissional.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
  FDQProfissional.Open;
  GetServicos(co_profissional);
  comboProfissional.KeyValue := co_profissional;
  comboServico.KeyValue      := co_servico;
end;

procedure TFrmTransferirAgendamento.GetHorariosDisponiveis(aValue: Integer);
begin
  wStrBuilder.Clear;
  wStrBuilder.AppendLine('SELECT A.CO_AGENDA, A.TI_HORARIO                 ')
             .AppendLine('  FROM AGENDA A                                  ')
             .AppendLine('  WHERE A.CO_PROFISSIONAL = :CO_PROFISSIONAL AND ')
             .AppendLine('        A.CO_EMPRESA      = :CO_EMPRESA      AND ')
             .AppendLine('        A.DT_AGENDA BETWEEN :DT_INICIAL      AND ')
             .AppendLine('                            :DT_FINAL        AND ')
             .AppendLine('        A.IN_STATUS = 1;                         ');
  try
    wFDQHorarios.SQL.Clear;
    wFDQHorarios.Connection := pConnection;
    wFDQHorarios.Open(wStrBuilder.ToString, [aValue, TParametro.co_empresa, StrToDate(edtData.Text), StrToDate(edtData.Text)]);
    if not wFDQHorarios.Eof then
    begin
      comboHorarios.Items.Clear;
      while not wFDQHorarios.Eof do
      begin
        comboHorarios.Items.AddObject(wFDQHorarios.FieldByName('TI_HORARIO').AsString, TObject(wFDQHorarios.FieldByName('CO_AGENDA').AsInteger));
        wFDQHorarios.Next;
      end;
    end else begin
      Application.MessageBox('O Profissional selecionado não tem horário disponível nesta data.', 'Atenção', MB_OK+MB_ICONINFORMATION);
      Exit;
    end;
  except

  end;
end;

procedure TFrmTransferirAgendamento.GetServicos(aValue: Integer);
begin
  wStrBuilder.Clear;
  wStrBuilder.AppendLine('SELECT S.CO_SERVICO, S.NM_SERVICO                                                     ')
             .AppendLine('  FROM PROFISSIONAL_SERVICO PS                                                        ')
             .AppendLine('    JOIN SERVICO S ON (S.CO_EMPRESA = PS.CO_EMPRESA AND S.CO_SERVICO = PS.CO_SERVICO) ')
             .AppendLine('  WHERE PS.CO_EMPRESA      = :CO_EMPRESA AND                                          ')
             .AppendLine('        PS.CO_PROFISSIONAL = :CO_PROFISSIONAL;                                        ');
  try
    wFDQServicos.Close;
    wFDQServicos.SQL.Clear;
    wFDQServicos.Connection := pConnection;
    dtsServico.DataSet  := wFDQServicos;
    wFDQServicos.Open(wStrBuilder.ToString, [TParametro.co_empresa, aValue]);
  except

  end;
end;

procedure TFrmTransferirAgendamento.Setco_agenda(const Value: Integer);
begin
  Fco_agenda := Value;
end;

procedure TFrmTransferirAgendamento.Setco_cliente(const Value: Integer);
begin
  Fco_cliente := Value;
end;

procedure TFrmTransferirAgendamento.Setco_profissional(const Value: Integer);
begin
  Fco_profissional := Value;
end;

procedure TFrmTransferirAgendamento.Setco_servico(const Value: Integer);
begin
  Fco_servico := Value;
end;

procedure TFrmTransferirAgendamento.SetpConnection(const Value: TFDConnection);
begin
  FpConnection := Value;
end;

end.
