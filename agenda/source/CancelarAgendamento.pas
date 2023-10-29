unit CancelarAgendamento;

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
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
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
  TFrmCancelarAgendamento = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    btnProcessar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    memObservacoes: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Fpconnection: TFDConnection;
    Fco_agenda: Integer;
    aFactory : TFactory;
    procedure Setco_agenda(const Value: Integer);
    procedure Setpconnection(const Value: TFDConnection);
    { Private declarations }
  public
    { Public declarations }
    property co_agenda : Integer read Fco_agenda write Setco_agenda;
    property pconnection : TFDConnection read Fpconnection write Setpconnection;
  end;

var
  FrmCancelarAgendamento: TFrmCancelarAgendamento;

implementation

{$R *.dfm}

procedure TFrmCancelarAgendamento.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmCancelarAgendamento.btnProcessarClick(Sender: TObject);
var
  wFDQuery : TFDQuery;
  wStrBuilder : TStringBuilder;
  wSucesso : Boolean;
begin
  if String(memObservacoes.Text).IsEmpty then
  begin
    Application.MessageBox('Informe o motivo do cancelamento.', 'Atenção', MB_OK+MB_ICONWARNING);
    memObservacoes.SetFocus;
    Exit;
  end;
  wFDQuery            := TFDQuery.Create(nil);
  wFDQuery.Connection := pconnection;
  wStrBuilder         := TStringBuilder.Create;
  try
    wStrBuilder.AppendLine('UPDATE AGENDA                      ')
               .AppendLine('  SET IN_STATUS    = :IN_STATUS,   ')
               .AppendLine('      OBSERVACOES  = :OBSERVACOES, ')
               .AppendLine('      CO_USUARIO   = :CO_USUARIO,  ')
               .AppendLine('      DT_ALTERACAO = :DT_ALTERACAO ')
               .AppendLine('  WHERE CO_AGENDA = :CO_AGENDA;    ');

    wFDQuery.SQL.Text := wStrBuilder.ToString;
    wFDQuery.ParamByName('IN_STATUS').AsInteger     := 3;
    wFDQuery.ParamByName('OBSERVACOES').AsString    := memObservacoes.Lines.Text;
    wFDQuery.ParamByName('CO_USUARIO').AsInteger    := TParametro.co_usuario;
    wFDQuery.ParamByName('DT_ALTERACAO').AsDateTime := aFactory.GetCurrentTimeStamp(pconnection);
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
  finally
    FreeAndNil(wFDQuery);
    FreeAndNil(wStrBuilder);
  end;
  if wSucesso then
    Application.MessageBox('Agendamento cancelado com sucesso.', 'Atenção', MB_OK+MB_ICONINFORMATION);
  btnFecharClick(Sender);
end;

procedure TFrmCancelarAgendamento.FormCreate(Sender: TObject);
begin
  pnlTitulo.Caption      := Self.Caption;
  GroupBox1.CaptionColor := clWhite;
  aFactory := TFactory.Create;
end;

procedure TFrmCancelarAgendamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
end;

procedure TFrmCancelarAgendamento.Setco_agenda(const Value: Integer);
begin
  Fco_agenda := Value;
end;

procedure TFrmCancelarAgendamento.Setpconnection(const Value: TFDConnection);
begin
  Fpconnection := Value;
end;

end.
