unit CancelarAgenda;

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
  PraButtonStyle,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Parametros,
  Factory,
  GroupBox.Interpose;

type
  TFrmCancelarAgenda = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    btnProcessar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    memObservacoes: TMemo;
    Label5: TLabel;
    comboProfissional: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    edtDataInicio: TMaskEdit;
    edtDataFim: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    FDQProfissional: TFDQuery;
    dtsProfissional: TDataSource;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDataFimExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    aFactory : TFactory;
    wPeriodo : TArray<TDateTime>;
  public
    { Public declarations }
  end;

var
  FrmCancelarAgenda: TFrmCancelarAgenda;

implementation

{$R *.dfm}

uses uDMConexao;

procedure TFrmCancelarAgenda.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmCancelarAgenda.FormCreate(Sender: TObject);
begin
  pnlTitulo.Caption      := Self.Caption;
  GroupBox1.CaptionColor := clWhite;
  GroupBox2.CaptionColor := clWhite;
  aFactory               := TFactory.Create;
  wPeriodo               := aFactory.GetFirstLastDayToMonth(DMConexao.FDConexao);
  edtDataInicio.Text     := DateToStr(wPeriodo[0]);
  edtDataFim.Text        := DateToStr(wPeriodo[1]);
end;

procedure TFrmCancelarAgenda.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
end;

procedure TFrmCancelarAgenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmCancelarAgenda.FormShow(Sender: TObject);
begin
  edtDataInicio.SetFocus;
end;

procedure TFrmCancelarAgenda.btnProcessarClick(Sender: TObject);
var
  wStrBuilder : TStringBuilder;
  wFDQuery    : TFDQuery;
  wSucesso    : Boolean;
begin
  if (StrToDateDef(edtDataInicio.Text, 0) > 0) and (StrToDateDef(edtDataFim.Text, 0) > 0) then
  begin
    if not(String(comboProfissional.Text).IsEmpty) then
    begin
      if String(memObservacoes.Lines.Text).IsEmpty then
      begin
        Application.MessageBox('Informe o motivo do cancelamento da agenda do Profissional.', 'Atenção', MB_OK+MB_ICONWARNING);
        memObservacoes.SetFocus;
      end else begin
        wStrBuilder         := TStringBuilder.Create;
        wFDQuery            := TFDQuery.Create(nil);
        wFDQuery.Connection := DMConexao.FDConexao;
        wStrBuilder.AppendLine('UPDATE AGENDA                                     ')
                   .AppendLine('  SET IN_STATUS    = 3,                           ')
                   .AppendLine('      OBSERVACOES  = :OBSERVACOES,                ')
                   .AppendLine('      CO_USUARIO   = :CO_USUARIO,                 ')
                   .AppendLine('      DT_ALTERACAO = :DT_ALTERACAO                ')
                   .AppendLine('  WHERE CO_PROFISSIONAL = :CO_PROFISSIONAL AND    ')
                   .AppendLine('        CO_EMPRESA      = :CO_EMPRESA      AND    ')
                   .AppendLine('        IN_STATUS       = 1                AND    ')
                   .AppendLine('        DT_AGENDA BETWEEN :DT_INICIO AND :DT_FIM; ');
        try
          wFDQuery.SQL.Text                                 := wStrBuilder.ToString;
          wFDQuery.ParamByName('OBSERVACOES').AsString      := memObservacoes.Lines.Text;
          wFDQuery.ParamByName('CO_USUARIO').AsInteger      := TParametro.co_usuario;
          wFDQuery.ParamByName('DT_ALTERACAO').AsDateTime   := aFactory.GetCurrentTimeStamp(DMConexao.FDConexao);
          wFDQuery.ParamByName('CO_PROFISSIONAL').AsInteger := comboProfissional.KeyValue;
          wFDQuery.ParamByName('CO_EMPRESA').AsInteger      := TParametro.co_empresa;
          wFDQuery.ParamByName('DT_INICIO').AsDate          := StrToDate(edtDataInicio.Text);
          wFDQuery.ParamByName('DT_FIM').AsDate             := StrToDate(edtDataFim.Text);
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
          FreeAndNil(wStrBuilder);
          FreeAndNil(wFDQuery);
        end;
        if wSucesso then
          Application.MessageBox('Agenda do Profissional cancelada com sucesso.', 'Atenção', MB_OK+MB_ICONINFORMATION);
      end;
    end;
  end;
end;

procedure TFrmCancelarAgenda.edtDataFimExit(Sender: TObject);
begin
  if (StrToDateDef(edtDataInicio.Text, 0) > 0) and (StrToDateDef(edtDataFim.Text, 0) > 0) then
  begin
    FDQProfissional.Close;
    FDQProfissional.ParamByName('DT_INICIO').AsDate := wPeriodo[0];
    FDQProfissional.ParamByName('DT_FIM').AsDate    := wPeriodo[1];
    FDQProfissional.Open;
    if not FDQProfissional.IsEmpty then
    begin
      comboProfissional.Enabled := True;
      comboProfissional.SetFocus;
    end
    else
    begin
      Application.MessageBox('Não há agenda gerada neste período', 'Atenção', MB_OK+MB_ICONINFORMATION);
      comboProfissional.Enabled := False;
      edtDataInicio.SetFocus;
    end;
  end;
end;

end.
