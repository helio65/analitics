unit Horario;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Generics.Collections,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ImgList,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.Mask,
  Vcl.DBCtrls,
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
  Factory,
  Persistence,
  CamposPesquisa, FireDAC.Stan.StorageBin;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmHorario = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    dtsHorario: TDataSource;
    Panel1: TPanel;
    pcPrincipal: TPageControl;
    tabConsulta: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    comboCampo: TComboBox;
    comboCondicao: TComboBox;
    edtValor: TEdit;
    Panel3: TPanel;
    Grid: TDBGrid;
    tabCadastro: TTabSheet;
    Panel4: TPanel;
    btnNovo: TPraButtonStyle;
    btnEditar: TPraButtonStyle;
    btnExcluir: TPraButtonStyle;
    btnGravar: TPraButtonStyle;
    btnCancelar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    btnAlternar: TPraButtonStyle;
    btnPesquisa: TPraButtonStyle;
    FDDHorario: TFDQuery;
    Label4: TLabel;
    CO_HORARIO: TDBEdit;
    Label5: TLabel;
    TX_DESCRICAO: TDBEdit;
    FDDHorarioCO_HORARIO: TIntegerField;
    FDDHorarioCO_EMPRESA: TIntegerField;
    FDDHorarioTX_DESCRICAO: TStringField;
    FDDHorarioDT_ALTERACAO: TSQLTimeStampField;
    FDDHorarioCO_USUARIO: TIntegerField;
    tabHorarios: TTabSheet;
    Panel5: TPanel;
    Label7: TLabel;
    TI_ENTRADA01: TDBEdit;
    Label6: TLabel;
    TI_SAIDA01: TDBEdit;
    Label8: TLabel;
    TI_ENDRADA02: TDBEdit;
    Label9: TLabel;
    TI_SAIDA02: TDBEdit;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    CO_DIA_SEMANA: TDBLookupComboBox;
    FDDHorarioDiario: TFDQuery;
    dtsHorarioDiario: TDataSource;
    FDMDiasDaSemana: TFDMemTable;
    dtsDiasDaSemana: TDataSource;
    FDDHorarioDiarioCO_HORARIO: TIntegerField;
    FDDHorarioDiarioCO_DIA_SEMANA: TIntegerField;
    FDDHorarioDiarioTI_ENTRADA01: TTimeField;
    FDDHorarioDiarioTI_SAIDA01: TTimeField;
    FDDHorarioDiarioTI_ENDRADA02: TTimeField;
    FDDHorarioDiarioTI_SAIDA02: TTimeField;
    FDMDiasDaSemanaCO_DIA: TIntegerField;
    FDMDiasDaSemanaNM_DIA: TStringField;
    btnHorarios: TPraButtonStyle;
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FDDHorarioAfterEdit(DataSet: TDataSet);
    procedure FDDHorarioBeforePost(DataSet: TDataSet);
    procedure FDDHorarioNewRecord(DataSet: TDataSet);
    procedure dtsHorarioStateChange(Sender: TObject);
    procedure FDDHorarioDiarioNewRecord(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FDDHorarioAfterScroll(DataSet: TDataSet);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnHorariosClick(Sender: TObject);
    procedure FDDHorarioDiarioCO_DIA_SEMANAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure dtsHorarioDiarioStateChange(Sender: TObject);
  private
    { Private declarations }
    aPersistence : TPersistence;
    aFactory : TFactory;
    FCamposPesquisa: TObjectList<TCamposPesquisa>;
    FTabela: String;
    procedure SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
    procedure SetTabela(const Value: String);
    property CamposPesquisa : TObjectList<TCamposPesquisa> read FCamposPesquisa write SetCamposPesquisa;
    property Tabela : String read FTabela write SetTabela;
    procedure AdicionarCamposPesquisa;
  public
    { Public declarations }
  end;

var
  FrmHorario: TFrmHorario;

implementation

{$R *.dfm}

uses
  uDMConexao;

procedure TFrmHorario.AdicionarCamposPesquisa;
var
  wIndex : Integer;
begin
  try
    wIndex         := 0;
    Tabela         := 'HORARIO';
    CamposPesquisa := TObjectList<TCamposPesquisa>.Create;
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'CO_HORARIO';
    CamposPesquisa[wIndex].Descricao := 'Código';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'TX_DESCRICAO';
    CamposPesquisa[wIndex].Descricao := 'Descrição';

    comboCampo.Items.Clear;
    for wIndex := 0 to Pred(CamposPesquisa.Count) do
    begin
      comboCampo.Items.AddObject(String(CamposPesquisa[wIndex].Descricao), TOBject(CamposPesquisa[wIndex].Campo));
    end;
    comboCampo.ItemIndex := 1;
  finally
//    FreeAndNil(FCamposPesquisa);
  end;
end;

procedure TFrmHorario.btnAlternarClick(Sender: TObject);
begin
  if pcPrincipal.ActivePageIndex = 1 then
  begin
    pcPrincipal.ActivePageIndex := 0;
    pcPrincipalChange(Sender);
  end else if pcPrincipal.ActivePageIndex = 2 then
  begin
    pcPrincipal.ActivePageIndex := 1;
    pcPrincipalChange(Sender);
  end;
end;

procedure TFrmHorario.btnCancelarClick(Sender: TObject);
begin
  if pcPrincipal.ActivePageIndex in [0, 1] then
    aPersistence.Cancelar(FDDHorario)
  else if pcPrincipal.ActivePageIndex = 2 then
    aPersistence.Cancelar(FDDHorarioDiario);
end;

procedure TFrmHorario.btnEditarClick(Sender: TObject);
begin
  if pcPrincipal.ActivePageIndex in [0, 1] then
  begin
    pcPrincipal.ActivePageIndex := 1;
    pcPrincipalChange(Sender);
    aPersistence.Editar(FDDHorario);
  end else if pcPrincipal.ActivePageIndex = 2 then
  begin
    aPersistence.Editar(FDDHorarioDiario);
  end;
end;

procedure TFrmHorario.btnExcluirClick(Sender: TObject);
begin
  if pcPrincipal.ActivePageIndex in [0, 1] then
  begin
    if Application.MessageBox('Confirma a exclusão deste horário?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
      aPersistence.Excluir(FDDHorario);
  end else if pcPrincipal.ActivePageIndex = 2 then
  begin
    if Application.MessageBox('Confirma a exclusão deste dia do horário?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
      aPersistence.Excluir(FDDHorarioDiario);
  end;
end;

procedure TFrmHorario.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmHorario.btnGravarClick(Sender: TObject);
begin
  if pcPrincipal.ActivePageIndex = 1 then
  begin
    aPersistence.Gravar(FDDHorario);
    FDDHorario.RefreshRecord();
  end else if pcPrincipal.ActivePageIndex = 2 then
  begin
    aPersistence.Gravar(FDDHorarioDiario);
  end;
end;

procedure TFrmHorario.btnHorariosClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 2;
  pcPrincipalChange(Sender);
end;

procedure TFrmHorario.btnNovoClick(Sender: TObject);
begin
  if pcPrincipal.ActivePageIndex = 0 then
  begin
    pcPrincipal.ActivePageIndex := 1;
    pcPrincipalChange(Sender);
    aPersistence.Incluir(FDDHorario);
  end else if pcPrincipal.ActivePageIndex = 2 then
  begin
    aPersistence.Incluir(FDDHorarioDiario);
  end;
end;

procedure TFrmHorario.btnPesquisaClick(Sender: TObject);
var
  wStrBuilder : TStringBuilder;
begin
  if String(edtValor.Text).IsEmpty then
  begin
    Application.MessageBox('Informe o valor a ser pesquisado.', 'Atenção', MB_OK+MB_ICONWARNING);
    Abort;
  end;
  wStrBuilder := TStringBuilder.Create;
  try
    wStrBuilder.AppendLine('SELECT *         ')
               .AppendLine('  FROM ' + Tabela );
    case comboCondicao.ItemIndex of
      0 : begin
            wStrBuilder.AppendLine('  WHERE ' + String(comboCampo.Items.Objects[comboCampo.ItemIndex]))
                       .AppendLine(' LIKE ' + QuotedStr('%' + edtValor.Text + '%') + ' AND ')
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA');
            if (Tabela = 'CLIENTE') then
              wStrBuilder.AppendLine(' AND IN_SITUACAO = ' + QuotedStr('A'));
      end;

      1 : begin
            wStrBuilder.AppendLine('  WHERE ' + String(comboCampo.Items.Objects[comboCampo.ItemIndex]))
                       .AppendLine(' LIKE ' + QuotedStr(edtValor.Text + '%')  + ' AND ')
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA');
      end;
    end;
    FDDHorario.Connection := DMConexao.FDConexao;
    if not FDDHorario.Connection.InTransaction then
      FDDHorario.Connection.StartTransaction;
    FDDHorario.SQL.Clear;
    FDDHorario.SQL.Text   := wStrBuilder.ToString;
    try
      FDDHorario.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
      FDDHorario.Open;
      FDDHorario.Connection.Commit;
      edtValor.Clear;
      edtValor.SetFocus;
    except
      on e : exception do
      begin
        FDDHorario.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
  end;
end;

procedure TFrmHorario.dtsHorarioDiarioStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsHorarioDiario);
  btnAlternar.Enabled := (not(dtsHorarioDiario.DataSet.State in [dsEdit, dsInsert]));
end;

procedure TFrmHorario.dtsHorarioStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsHorario);
  btnAlternar.Enabled := (not(dtsHorario.DataSet.State in [dsEdit, dsInsert]));
end;

procedure TFrmHorario.FDDHorarioAfterEdit(DataSet: TDataSet);
begin
  FDDHorarioDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDHorario.Connection));
  FDDHorarioCO_USUARIO.AsInteger    := TParametro.co_usuario;
end;

procedure TFrmHorario.FDDHorarioAfterScroll(DataSet: TDataSet);
begin
  FDDHorarioDiario.Close;
  FDDHorarioDiario.ParamByName('CO_HORARIO').AsInteger := FDDHorarioCO_HORARIO.AsInteger;
  FDDHorarioDiario.Open;
end;

procedure TFrmHorario.FDDHorarioBeforePost(DataSet: TDataSet);
var
  aListaErros : TStrings;
begin
  aListaErros := aFactory.ValidaCamposObrigatorios(DataSet);
  try
    if Trim(aListaErros.Text) <> '' then
      raise Exception.Create('Campos de preenchimento obrigatório.' +#13+#13+aListaErros.Text);
  finally
    FreeAndNil(aListaErros);
  end;
end;

procedure TFrmHorario.FDDHorarioDiarioCO_DIA_SEMANAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case FDDHorarioDiarioCO_DIA_SEMANA.AsInteger of
    1 : Text := 'Domigo';
    2 : Text := 'Segunda-feira';
    3 : Text := 'Terça-feira';
    4 : Text := 'Quarta-feira';
    5 : Text := 'Quinta-feira';
    6 : Text := 'Sexta-feira';
    7 : Text := 'Sábado';
  end;
end;

procedure TFrmHorario.FDDHorarioDiarioNewRecord(DataSet: TDataSet);
begin
  FDDHorarioDiarioCO_HORARIO.AsInteger := FDDHorarioCO_HORARIO.AsInteger;
end;

procedure TFrmHorario.FDDHorarioNewRecord(DataSet: TDataSet);
begin
  FDDHorarioCO_EMPRESA.AsInteger := TParametro.co_empresa;
  FDDHorarioCO_USUARIO.AsInteger := TParametro.co_usuario;
end;

procedure TFrmHorario.FormCreate(Sender: TObject);
begin
  comboCondicao.ItemIndex         := 0;
  btnNovo.Left                    := Integer(tNovo);
  btnEditar.Left                  := Integer(tEditar);
  btnExcluir.Left                 := Integer(tExcluir);
  btnGravar.Left                  := Integer(tGravar);
  btnCancelar.Left                := Integer(tCancelar);
  btnAlternar.Left                := 285;//Integer(tAlteranr);
  btnNovo.Brush.Color             := $00FE6F2C;
  btnNovo.BrushDown.Color         := btnNovo.Brush.Color;
  btnNovo.BrushFocused.Color      := btnNovo.Brush.Color;
  btnNovo.BrushDisabled.Color     := btnNovo.Brush.Color;
  btnEditar.Brush.Color           := $0068625A;
  btnEditar.BrushDown.Color       := btnEditar.Brush.Color;
  btnEditar.BrushFocused.Color    := btnEditar.Brush.Color;
  btnEditar.BrushDisabled.Color   := btnEditar.Brush.Color;
  btnExcluir.Brush.Color          := $003626C6;
  btnExcluir.BrushDown.Color      := btnExcluir.Brush.Color;
  btnExcluir.BrushFocused.Color   := btnExcluir.Brush.Color;
  btnExcluir.BrushDisabled.Color  := btnExcluir.Brush.Color;
  btnGravar.Brush.Color           := $00388A22;
  btnGravar.BrushDown.Color       := btnGravar.Brush.Color;
  btnGravar.BrushFocused.Color    := btnGravar.Brush.Color;
  btnGravar.BrushDisabled.Color   := btnGravar.Brush.Color;
  btnCancelar.Brush.Color         := $000FACDE;
  btnCancelar.BrushDown.Color     := btnCancelar.Brush.Color;
  btnCancelar.BrushFocused.Color  := btnCancelar.Brush.Color;
  btnCancelar.BrushDisabled.Color := btnCancelar.Brush.Color;
  btnFechar.Brush.Color           := $00978420;
  btnFechar.BrushDown.Color       := btnFechar.Brush.Color;
  btnFechar.BrushFocused.Color    := btnFechar.Brush.Color;
  btnFechar.BrushDisabled.Color   := btnFechar.Brush.Color;
  btnAlternar.Brush.Color         := $00E5E0DA;
  btnAlternar.BrushDown.Color     := btnAlternar.Brush.Color;
  btnAlternar.BrushFocused.Color  := btnAlternar.Brush.Color;
  btnAlternar.BrushDisabled.Color := btnAlternar.Brush.Color;
  aPersistence                    := TPersistence.Create;
  aFactory                        := TFactory.Create;
end;

procedure TFrmHorario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
  FreeAndNil(FCamposPesquisa);
end;

procedure TFrmHorario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmHorario.FormShow(Sender: TObject);
begin
  pcPrincipal.ActivePage := tabConsulta;
  pnlTitulo.Caption      := Self.Caption;
  btnHorarios.Width      := 138;
  btnHorarios.Height     := 48;
  FDMDiasDaSemana.Open;
  pcPrincipalChange(Sender);
  AdicionarCamposPesquisa;
end;

procedure TFrmHorario.GridDblClick(Sender: TObject);
begin
  if dtsHorario.DataSet.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmHorario.pcPrincipalChange(Sender: TObject);
begin
  btnAlternar.Visible := (pcPrincipal.ActivePageIndex = 1) or (pcPrincipal.ActivePageIndex = 2);
  btnAlternar.Enabled := (pcPrincipal.ActivePageIndex = 1) or (pcPrincipal.ActivePageIndex = 2);
end;


procedure TFrmHorario.SetCamposPesquisa(
  const Value: TObjectList<TCamposPesquisa>);
begin
  FCamposPesquisa := Value;
end;

procedure TFrmHorario.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

end.
