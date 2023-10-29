unit ProfissionalServico;

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
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  PraButtonStyle,
  Factory,
  Parametros;

type
  TFrmProfissionalServico = class(TForm)
    pnlBotoes: TPanel;
    btnNovo: TPraButtonStyle;
    btnGravar: TPraButtonStyle;
    btnCancelar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    pnlTitulo: TPanel;
    Panel1: TPanel;
    FDDProfissionalServico: TFDQuery;
    FDDProfissionalServicoCO_EMPRESA: TIntegerField;
    FDDProfissionalServicoCO_SERVICO: TIntegerField;
    FDDProfissionalServicoCO_PROFISSIONAL: TIntegerField;
    FDDProfissionalServicoDT_ALTERACAO: TSQLTimeStampField;
    FDDProfissionalServicoCO_USUARIO: TIntegerField;
    FDDProfissionalServicoNM_SERVICO: TStringField;
    dtsProfissionalServico: TDataSource;
    FDQServico: TFDQuery;
    dtsServico: TDataSource;
    Label9: TLabel;
    edtCO_SERVICO: TDBEdit;
    comboCO_SERVICO: TDBLookupComboBox;
    btnEditar: TPraButtonStyle;
    btnExcluir: TPraButtonStyle;
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDDProfissionalServicoNewRecord(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dtsProfissionalServicoStateChange(Sender: TObject);
    procedure edtCO_SERVICOExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    aFactory : TFactory;
    Fco_profissional: Integer;
    procedure Setco_profissional(const Value: Integer);
  public
    { Public declarations }
    property co_profissional : Integer read Fco_profissional write Setco_profissional;
  end;

var
  FrmProfissionalServico: TFrmProfissionalServico;

implementation

{$R *.dfm}

procedure TFrmProfissionalServico.btnCancelarClick(Sender: TObject);
begin
  FDDProfissionalServico.CancelUpdates;
  FDDProfissionalServico.Connection.Commit;
end;

procedure TFrmProfissionalServico.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmProfissionalServico.btnGravarClick(Sender: TObject);
begin
  if String(comboCO_SERVICO.Text).IsEmpty then
  begin
    Application.MessageBox('Informe o serviço a ser cadastro nas habilidades do Profissional.', 'Atenção', MB_OK+MB_ICONERROR);
    edtCO_SERVICO.SetFocus;
    Abort;
  end;
  if not FDDProfissionalServico.Connection.InTransaction then
    FDDProfissionalServico.Connection.StartTransaction;
  try
    FDDProfissionalServico.Post;
    FDDProfissionalServico.ApplyUpdates(0);
    FDDProfissionalServico.Connection.Commit;
  except
    on e : exception do
    begin
      FDDProfissionalServico.Connection.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TFrmProfissionalServico.btnNovoClick(Sender: TObject);
begin
  FDDProfissionalServico.Connection.StartTransaction;
  if not FDDProfissionalServico.Active then
    FDDProfissionalServico.Open;
  FDDProfissionalServico.Insert;
end;

procedure TFrmProfissionalServico.dtsProfissionalServicoStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsProfissionalServico);
end;

procedure TFrmProfissionalServico.edtCO_SERVICOExit(Sender: TObject);
var
  wStrBuilder : TStringBuilder;
  wFDQuery    : TFDQuery;
begin
  if FDDProfissionalServico.State in [dsInsert] then
  begin
    if String(edtCO_SERVICO.Text).IsEmpty then
      Exit;
    wStrBuilder := TStringBuilder.Create;
    wFDQuery    := TFDQuery.Create(nil);
    wFDQuery.Connection := FDDProfissionalServico.Connection;
    try
      wStrBuilder.AppendLine('SELECT CO_SERVICO                    ')
                 .AppendLine('  FROM SERVICO                       ')
                 .AppendLine('  WHERE CO_EMPRESA = :CO_EMPRESA AND ')
                 .AppendLine('        CO_SERVICO = :CO_SERVICO;    ');
      wFDQuery.Open(wStrBuilder.ToString, [edtCO_SERVICO.Text]);

      if wFDQuery.FieldByName('CO_SERVICO').IsNull then
      begin
        Application.MessageBox('Não existe serviço cadastrado com este código!', 'Atenção', MB_OK+MB_ICONWARNING);
        edtCO_SERVICO.SetFocus;
        Abort;
      end;
    finally
      FreeAndNil(wStrBuilder);
      FreeAndNil(wFDQuery);
    end;
  end;
end;

procedure TFrmProfissionalServico.FDDProfissionalServicoNewRecord(
  DataSet: TDataSet);
begin
  FDDProfissionalServicoCO_EMPRESA.AsInteger      := TParametro.co_empresa;
  FDDProfissionalServicoCO_PROFISSIONAL.AsInteger := co_profissional;
  FDDProfissionalServicoCO_USUARIO.AsInteger      := TParametro.co_usuario;
end;

procedure TFrmProfissionalServico.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
begin
  if FDDProfissionalServico.State in [dsInsert] then
  begin
    if Application.MessageBox('Foi adicionada uma nova habilidade para o Profissional, mais ainda não foi salva - cancela?', 'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION) = IDYES then
    begin
      FDDProfissionalServico.CancelUpdates;
      FDDProfissionalServico.Connection.Commit;
      CanClose := True;
    end;
  end;
end;

procedure TFrmProfissionalServico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmProfissionalServico.FormShow(Sender: TObject);
begin
  FDQServico.Close;
  FDQServico.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
  FDQServico.Open;
  edtCO_SERVICO.SetFocus;
end;

procedure TFrmProfissionalServico.Setco_profissional(const Value: Integer);
begin
  Fco_profissional := Value;
end;

end.
