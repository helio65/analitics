unit GerarAgenda;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.DateUtils,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.Samples.Gauges,
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
  Data.DB,
  PraButtonStyle,
  Factory,
  Parametros,
  CheckBox.Interpose,
  GroupBox.Interpose;

type
  TFrmGerarAgenda = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    btnProcessar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DataInicial: TMaskEdit;
    Label2: TLabel;
    DataFinal: TMaskEdit;
    chkTodoProfissionais: TCheckBox;
    Label3: TLabel;
    comboProfissionais: TDBLookupComboBox;
    FDQProfissionais: TFDQuery;
    dtsProfissionais: TDataSource;
    pnlProgresso: TPanel;
    Gauge1: TGauge;
    procedure chkTodoProfissionaisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DataInicialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    wDia,
    wMes,
    wAno : Word;
    aFactory : TFactory;
  public
    { Public declarations }
  end;

var
  FrmGerarAgenda: TFrmGerarAgenda;

implementation

{$R *.dfm}

uses uDMConexao;

procedure TFrmGerarAgenda.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmGerarAgenda.btnProcessarClick(Sender: TObject);
var
  wHorarioDiario : THoratios;
  wHorarios      : TOBjectList<THoratios>;
  wAgendas       : TOBjectList<TAgenda>;
  wAgenda        : TAgenda;
  wFeriados      : TArray<Integer>;
  wStrBuilder    : TStringBuilder;
  wFDQuery       : TFDQuery;
  wIndex         : Integer;
begin

  //STATUS DA AGENDA
  //IN_STATUS = 1 - Horário livre, 2 - Horário agendado, 3 - Horário cancelado

  btnProcessar.Enabled := False;
  wStrBuilder          := TStringBuilder.Create;
  wFDQuery             := TFDQuery.Create(nil);
  wFDQuery.Connection  := DMConexao.FDConexao;
  try
    wStrBuilder.AppendLine('SELECT F.DT_FERIADO                                 ')
               .AppendLine('  FROM FERIADO F                                    ')
               .AppendLine('  WHERE EXTRACT(MONTH FROM F.DT_FERIADO) = :MES AND ')
               .AppendLine('        EXTRACT(YEAR FROM F.DT_FERIADO)  = :ANO;    ');

    wFDQuery.Open(wStrBuilder.ToString, [wMes, wAno]); //Busca os feriados do mês

    if not wFDQuery.Eof then
    begin
      SetLength(wFeriados, wFDQuery.RecordCount); //Cria um array com os feriados do mês que serão usados na geração da agenda.
      wIndex := 0;
      while not wFDQuery.Eof do
      begin
        wFeriados[wIndex] := DayOf(wFDQuery.FieldByName('DT_FERIADO').AsDateTime);
        Inc(wIndex);
        wFDQuery.Next;
      end;
    end;

    wStrBuilder.Clear;
    wStrBuilder.AppendLine('SELECT P.TI_INTERVALO, HD.CO_DIA_SEMANA,                                                  ')
               .AppendLine('       HD.TI_ENTRADA01, HD.TI_SAIDA01,                                                    ')
               .AppendLine('       HD.TI_ENDRADA02, HD.TI_SAIDA02                                                     ')
               .AppendLine('  FROM PROFISSIONAL P                                                                     ')
               .AppendLine('    JOIN HORARIO H ON (H.CO_HORARIO = P.CO_HORARIO)                                       ')
               .AppendLine('    JOIN HORARIO_DIARIO HD ON (HD.CO_HORARIO = H.CO_HORARIO)                              ')
               .AppendLine('  WHERE P.CO_PROFISSIONAL = :CO_PROFISSIONAL AND                                          ')
               .AppendLine('        P.CO_PROFISSIONAL NOT IN (SELECT A.CO_PROFISSIONAL                                ')
               .AppendLine('                                    FROM AGENDA A                                         ')
               .AppendLine('                                    WHERE A.DT_AGENDA BETWEEN :DT_INICIAL AND :DT_FINAL); ');

    if not chkTodoProfissionais.Checked then //Gera agenda de apenas um Profissional.
    begin
      wFDQuery.Open(wStrBuilder.ToString, [FDQProfissionais.FieldByName('CO_PROFISSIONAL').AsInteger,
                                           StrToDate(DataInicial.Text),
                                           StrToDate(DataFinal.Text)]); //Busca os horários do Profissional
      if not wFDQuery.Eof then
      begin

        wHorarios := TObjectList<THoratios>.Create; //Cria um  objectlist com os horários diario do profissional.
        try
          while not wFDQuery.Eof do
          begin
            wHorarioDiario := THoratios.Create;
            wHorarioDiario.dia      := wFDQuery.FieldByName('CO_DIA_SEMANA').AsInteger;
            wHorarioDiario.entrada1 := wFDQuery.FieldByName('TI_ENTRADA01').AsDateTime;
            wHorarioDiario.saida1   := wFDQuery.FieldByName('TI_SAIDA01').AsDateTime;
            wHorarioDiario.entrada2 := wFDQuery.FieldByName('TI_ENDRADA02').AsDateTime;
            wHorarioDiario.saida2   := wFDQuery.FieldByName('TI_SAIDA02').AsDateTime;
            wHorarios.Add(wHorarioDiario);
            wFDQuery.Next;
          end;

          wAgendas := aFactory.GerarAgenda(FDQProfissionais.FieldByName('CO_PROFISSIONAL').AsInteger,
                                          wMes, wAno,
                                          wFDQuery.FieldByName('TI_INTERVALO').AsDateTime,
                                          wHorarios, wFeriados); //Gera a agenda do Profissional.
          wStrBuilder.Clear;
          wStrBuilder.AppendLine('INSERT INTO AGENDA (CO_AGENDA, CO_EMPRESA, CO_PROFISSIONAL,                  ')
                     .AppendLine('                    DT_AGENDA, TI_HORARIO, IN_STATUS, CO_USUARIO)            ')
                     .AppendLine('            VALUES (GEN_ID(INC_CO_AGENDA, 1), :CO_EMPRESA, :CO_PROFISSIONAL, ')
                     .AppendLine('                    :DT_AGENDA, :TI_HORARIO, :IN_STATUS, :CO_USUARIO);       ');

          //Inseri os horários do Profissional na tabela.
          wFDQuery.SQL.Clear;
          wFDQuery.SQL.Text := wStrBuilder.ToString;
          for wAgenda in wAgendas do
          begin
            wFDQuery.ParamByName('CO_EMPRESA').AsInteger      := TParametro.co_empresa;
            wFDQuery.ParamByName('CO_PROFISSIONAL').AsInteger := FDQProfissionais.FieldByName('CO_PROFISSIONAL').AsInteger;
            wFDQuery.ParamByName('DT_AGENDA').AsDate          := wAgenda.data;
            wFDQuery.ParamByName('TI_HORARIO').AsTime         := wAgenda.horario;
            wFDQuery.ParamByName('IN_STATUS').AsInteger       := 1;
            wFDQuery.ParamByName('CO_USUARIO').AsInteger      := TParametro.co_usuario;
            try
              wFDQuery.ExecSQL;
              wFDQuery.Connection.Commit;
            except
              on e : exception do
              begin
                wFDQuery.Connection.Rollback;
                raise Exception.Create(e.Message);
              end;
            end;
          end;
        finally
          FreeAndNil(wHorarios);
          FreeAndNil(wAgendas);
        end;
      end;
    end else begin

      pnlProgresso.Visible := True;
      Gauge1.MinValue      := 0;
      Gauge1.MaxValue      := FDQProfissionais.RecordCount;
      FDQProfissionais.First;
      while not FDQProfissionais.Eof do  //Gera agenda de todos os Profissionais.
      begin
        wStrBuilder.Clear;
        wStrBuilder.AppendLine('SELECT P.TI_INTERVALO, HD.CO_DIA_SEMANA,                                                  ')
                   .AppendLine('       HD.TI_ENTRADA01, HD.TI_SAIDA01,                                                    ')
                   .AppendLine('       HD.TI_ENDRADA02, HD.TI_SAIDA02                                                     ')
                   .AppendLine('  FROM PROFISSIONAL P                                                                     ')
                   .AppendLine('    JOIN HORARIO H ON (H.CO_HORARIO = P.CO_HORARIO)                                       ')
                   .AppendLine('    JOIN HORARIO_DIARIO HD ON (HD.CO_HORARIO = H.CO_HORARIO)                              ')
                   .AppendLine('  WHERE P.CO_PROFISSIONAL = :CO_PROFISSIONAL AND                                          ')
                   .AppendLine('        P.CO_PROFISSIONAL NOT IN (SELECT A.CO_PROFISSIONAL                                ')
                   .AppendLine('                                    FROM AGENDA A                                         ')
                   .AppendLine('                                    WHERE A.DT_AGENDA BETWEEN :DT_INICIAL AND :DT_FINAL); ');

        wFDQuery.Open(wStrBuilder.ToString, [FDQProfissionais.FieldByName('CO_PROFISSIONAL').AsInteger,
                                             StrToDate(DataInicial.Text),
                                             StrToDate(DataFinal.Text)]); //Busca os horários do Profissional
        if not wFDQuery.Eof then
        begin

          wHorarios := TObjectList<THoratios>.Create; //Cria um  objectlist com os horários diario do profissional.
          try
            while not wFDQuery.Eof do
            begin
              wHorarioDiario := THoratios.Create;
              wHorarioDiario.dia      := wFDQuery.FieldByName('CO_DIA_SEMANA').AsInteger;
              wHorarioDiario.entrada1 := wFDQuery.FieldByName('TI_ENTRADA01').AsDateTime;
              wHorarioDiario.saida1   := wFDQuery.FieldByName('TI_SAIDA01').AsDateTime;
              wHorarioDiario.entrada2 := wFDQuery.FieldByName('TI_ENDRADA02').AsDateTime;
              wHorarioDiario.saida2   := wFDQuery.FieldByName('TI_SAIDA02').AsDateTime;
              wHorarios.Add(wHorarioDiario);
              wFDQuery.Next;
            end;

            wAgendas := aFactory.GerarAgenda(FDQProfissionais.FieldByName('CO_PROFISSIONAL').AsInteger,
                                            wMes, wAno,
                                            wFDQuery.FieldByName('TI_INTERVALO').AsDateTime,
                                            wHorarios, wFeriados); //Gera a agenda do Profissional.
            wStrBuilder.Clear;
            wStrBuilder.AppendLine('INSERT INTO AGENDA (CO_AGENDA, CO_EMPRESA, CO_PROFISSIONAL,                  ')
                       .AppendLine('                    DT_AGENDA, TI_HORARIO, IN_STATUS, CO_USUARIO)            ')
                       .AppendLine('            VALUES (GEN_ID(INC_CO_AGENDA, 1), :CO_EMPRESA, :CO_PROFISSIONAL, ')
                       .AppendLine('                    :DT_AGENDA, :TI_HORARIO, :IN_STATUS, :CO_USUARIO);       ');

            //Inseri os horários do Profissional na tabela.
            wFDQuery.SQL.Clear;
            wFDQuery.SQL.Text := wStrBuilder.ToString;
            for wAgenda in wAgendas do
            begin
              wFDQuery.ParamByName('CO_EMPRESA').AsInteger      := TParametro.co_empresa;
              wFDQuery.ParamByName('CO_PROFISSIONAL').AsInteger := FDQProfissionais.FieldByName('CO_PROFISSIONAL').AsInteger;
              wFDQuery.ParamByName('DT_AGENDA').AsDate          := wAgenda.data;
              wFDQuery.ParamByName('TI_HORARIO').AsTime         := wAgenda.horario;
              wFDQuery.ParamByName('IN_STATUS').AsInteger       := 1;
              wFDQuery.ParamByName('CO_USUARIO').AsInteger      := TParametro.co_usuario;
              try
                wFDQuery.ExecSQL;
                wFDQuery.Connection.Commit;
              except
                on e : exception do
                begin
                  wFDQuery.Connection.Rollback;
                  raise Exception.Create(e.Message);
                end;
              end;
            end;
          finally
            FreeAndNil(wHorarios);
            FreeAndNil(wAgendas);
          end;
        end;
        Gauge1.AddProgress(1);
        FDQProfissionais.Next;
        Application.ProcessMessages;
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
    FreeAndNil(wFDQuery);
    btnProcessar.Enabled := True;
    pnlProgresso.Visible := False;
  end;
end;

procedure TFrmGerarAgenda.chkTodoProfissionaisClick(Sender: TObject);
begin
  comboProfissionais.Enabled := not chkTodoProfissionais.Checked;
end;

procedure TFrmGerarAgenda.DataInicialKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8])) then
  begin
    Key := #0;
  end;
end;

procedure TFrmGerarAgenda.FormCreate(Sender: TObject);
begin
  pnlTitulo.Caption      := Self.Caption;
  GroupBox1.CaptionColor := clWhite;
  btnProcessar.Width     := 117;
  aFactory := TFactory.Create;
end;

procedure TFrmGerarAgenda.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aFactory);
end;

procedure TFrmGerarAgenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmGerarAgenda.FormShow(Sender: TObject);
var
  wDataInicial, wDataFinal : String;
  wQtdeDias : Integer;
begin
  FDQProfissionais.Open;
  DecodeDate(Date, wAno, wMes, wDia);
  wQtdeDias    := DaysInMonth(Date);
  wDataInicial := '01/' +FormatFloat('00', wMes) +'/'+ IntToStr(wAno);
  wDataFinal   := IntToStr(wQtdeDias) +'/'+ FormatFloat('00', wMes) +'/'+ IntToStr(wAno);
  DataInicial.EditText := wDataInicial;
  DataFinal.EditText := wDataFinal;
  DataInicial.SetFocus;
end;

end.
