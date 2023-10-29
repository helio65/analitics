unit Agendamento;

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
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  PraButtonStyle,
  Parametros,
  Factory,
  GroupBox.Interpose;

type
  TFrmAgendamento = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    btnProcessar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    Panel4: TPanel;
    pnlProgresso: TPanel;
    edtData: TMaskEdit;
    edtHorario: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtProfissional: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    comboServico: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    memObservacoes: TMemo;
    dtsServicos: TDataSource;
    Label5: TLabel;
    comboCliente: TDBLookupComboBox;
    FDQCliente: TFDQuery;
    dtsCliente: TDataSource;
    FDQServico: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
  private
    Fpconnection: TFDConnection;
    Fco_profissional: Integer;
    wFDQuery : TFDQuery;
    wStrBuilder : TStringBuilder;
    Fco_agenda: Integer;
    aFactory : TFactory;
    procedure Setco_profissional(const Value: Integer);
    procedure Setpconnection(const Value: TFDConnection);
    procedure Setco_agenda(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure GetServicos;
    property co_profissional : Integer read Fco_profissional write Setco_profissional;
    property pconnection : TFDConnection read Fpconnection write Setpconnection;
    property co_agenda : Integer read Fco_agenda write Setco_agenda;
  end;

var
  FrmAgendamento: TFrmAgendamento;

implementation

{$R *.dfm}

{ TFrmAgendamento }

procedure TFrmAgendamento.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmAgendamento.btnProcessarClick(Sender: TObject);
begin
  if String(comboCliente.Text).IsEmpty then
  begin
    ShowMessage('Selecione o cliente para o qual está sendo feito o agendamento.');
    comboCliente.SetFocus;
    Exit;
  end;
  if String(comboServico.Text).IsEmpty then
  begin
    ShowMessage('Selecione o serviço que estásendo agendamento.');
    comboServico.SetFocus;
    Exit;
  end;
  wFDQuery.Connection := pconnection;
  wStrBuilder.Clear;
  wStrBuilder.AppendLine('UPDATE AGENDA                      ')
             .AppendLine('  SET CO_SERVICO   = :CO_SERVICO,  ')
             .AppendLine('      CO_CLIENTE   = :CO_CLIENTE,  ')
             .AppendLine('      IN_STATUS    = :IN_STATUS,   ')
             .AppendLine('      OBSERVACOES  = :OBSERVACOES, ')
             .AppendLine('      CO_USUARIO   = :CO_USUARIO,  ')
             .AppendLine('      DT_ALTERACAO = :DT_ALTERACAO ')
             .AppendLine('  WHERE CO_AGENDA = :CO_AGENDA;    ');
  try
    wFDQuery.SQL.Clear;
    wFDQuery.SQL.Text := wStrBuilder.ToString;
    wFDQuery.ParamByName('CO_SERVICO').AsInteger := comboServico.KeyValue;
    wFDQuery.ParamByName('CO_CLIENTE').AsInteger := comboCliente.KeyValue;
    wFDQuery.ParamByName('IN_STATUS').AsInteger  := 2;
    if not String(memObservacoes.Lines.Text).IsEmpty then
      wFDQuery.ParamByName('OBSERVACOES').AsString := memObservacoes.Lines.Text
    else
      wFDQuery.ParamByName('OBSERVACOES').Value := null;
    wFDQuery.ParamByName('CO_USUARIO').AsInteger    := TParametro.co_usuario;
    wFDQuery.ParamByName('DT_ALTERACAO').AsDateTime := aFactory.GetCurrentTimeStamp(pconnection);
    wFDQuery.ParamByName('CO_AGENDA').AsInteger     := co_agenda;
    wFDQuery.Connection.StartTransaction;
    wFDQuery.ExecSQL;
    wFDQuery.Connection.Commit;
  except
    on e : exception do
    begin
      wFDQuery.Connection.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
  btnFecharClick(Sender);
end;

procedure TFrmAgendamento.FormCreate(Sender: TObject);
begin
  pnlTitulo.Caption      := Self.Caption;
  GroupBox1.CaptionColor := clWhite;
  wFDQuery               := TFDQuery.Create(nil);
  wStrBuilder            := TStringBuilder.Create;
  aFactory               := TFactory.Create;
end;

procedure TFrmAgendamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(wFDQuery);
  FreeAndNil(wStrBuilder);
  FreeAndNil(aFactory);
end;

procedure TFrmAgendamento.FormShow(Sender: TObject);
begin
  FDQCliente.Close;
  FDQCliente.Connection := pconnection;
  FDQCliente.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
  FDQCliente.Open;
  GetServicos;
end;

procedure TFrmAgendamento.GetServicos;
begin
  FDQServico.Close;
  FDQServico.Connection                               := pconnection;
  FDQServico.ParamByName('CO_EMPRESA').AsInteger      := TParametro.co_empresa;
  FDQServico.ParamByName('CO_PROFISSIONAL').AsInteger := co_profissional;
  FDQServico.Open;
end;

procedure TFrmAgendamento.Setco_agenda(const Value: Integer);
begin
  Fco_agenda := Value;
end;

procedure TFrmAgendamento.Setco_profissional(const Value: Integer);
begin
  Fco_profissional := Value;
end;

procedure TFrmAgendamento.Setpconnection(const Value: TFDConnection);
begin
  Fpconnection := Value;
end;

end.
