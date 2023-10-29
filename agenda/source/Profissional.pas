unit Profissional;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Generics.Collections,
  System.RegularExpressions,
  System.JSON,
  System.JSON.Types,
  System.JSON.Writers,
  System.JSON.Builders,
  System.JSON.Readers,
  System.UITypes,
  Rest.JSON,
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
  Vcl.DBCtrls,
  Vcl.Mask,
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
  Factory,
  Parametros,
  Persistence,
  CamposPesquisa,
  DadosCep, FireDAC.Stan.StorageBin;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmProfissional = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    dtsProfissional: TDataSource;
    Panel1: TPanel;
    pcPrincipal: TPageControl;
    tabConsulta: TTabSheet;
    tabCadastro: TTabSheet;
    Panel4: TPanel;
    btnNovo: TPraButtonStyle;
    btnEditar: TPraButtonStyle;
    btnExcluir: TPraButtonStyle;
    btnGravar: TPraButtonStyle;
    btnCancelar: TPraButtonStyle;
    btnFechar: TPraButtonStyle;
    btnAlternar: TPraButtonStyle;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    CO_PROFISSIONAL: TDBEdit;
    NU_CPF: TDBEdit;
    NM_PROFISSIONAL: TDBEdit;
    NU_CEP: TDBEdit;
    TX_LOGRADOURO: TDBEdit;
    NU_LOGRADOURO: TDBEdit;
    TX_BAIRRO: TDBEdit;
    comboCO_CIDADE: TDBLookupComboBox;
    NU_CELULAR: TDBEdit;
    NU_TELEFONE: TDBEdit;
    TX_EMAIL: TDBEdit;
    DT_NASCIMENTO: TDBEdit;
    TX_COMPLEMENTO: TDBEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    btnNovaHabilidade: TPraButtonStyle;
    Panel8: TPanel;
    DBGrid1: TDBGrid;
    FDDProfissional: TFDQuery;
    FDDProfissionalCO_PROFISSIONAL: TFDAutoIncField;
    FDDProfissionalCO_CIDADE: TIntegerField;
    FDDProfissionalCO_EMPRESA: TIntegerField;
    FDDProfissionalNM_PROFISSIONAL: TStringField;
    FDDProfissionalDT_NASCIMENTO: TDateField;
    FDDProfissionalTX_LOGRADOURO: TStringField;
    FDDProfissionalTX_BAIRRO: TStringField;
    FDDProfissionalTX_COMPLEMENTO: TStringField;
    FDDProfissionalNU_CEP: TStringField;
    FDDProfissionalNU_LOGRADOURO: TIntegerField;
    FDDProfissionalNU_TELEFONE: TStringField;
    FDDProfissionalNU_CELULAR: TStringField;
    FDDProfissionalTX_EMAIL: TStringField;
    FDDProfissionalNU_CPF: TStringField;
    FDDProfissionalIN_SITUACAO: TStringField;
    FDDProfissionalCO_USUARIO: TIntegerField;
    FDDProfissionalDT_ALTERACAO: TSQLTimeStampField;
    FDQProfissionalServico: TFDQuery;
    dtsProfissionalServico: TDataSource;
    FDQCidade: TFDQuery;
    dtsCidade: TDataSource;
    dtsSitucao: TDataSource;
    FDMSituacao: TFDMemTable;
    FDMSituacaoCO_SITUACAO: TStringField;
    FDMSituacaoNM_SITUACAO: TStringField;
    comboIN_SITUACAO: TDBLookupComboBox;
    FDQProfissionalServicoCO_EMPRESA: TIntegerField;
    FDQProfissionalServicoCO_SERVICO: TIntegerField;
    FDQProfissionalServicoCO_PROFISSIONAL: TIntegerField;
    FDQProfissionalServicoNM_SERVICO: TStringField;
    Label15: TLabel;
    CO_HORARIO: TDBLookupComboBox;
    Label19: TLabel;
    TI_INTERVALO: TDBEdit;
    FDDProfissionalCO_HORARIO: TIntegerField;
    FDDProfissionalTI_INTERVALO: TTimeField;
    FDQHorario: TFDQuery;
    dtsHorario: TDataSource;
    Panel2: TPanel;
    Panel9: TPanel;
    Grid: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnPesquisa: TPraButtonStyle;
    comboCampo: TComboBox;
    comboCondicao: TComboBox;
    edtValor: TEdit;
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FDDProfissionalNU_CEPValidate(Sender: TField);
    procedure FormDestroy(Sender: TObject);
    procedure FDDProfissionalTX_EMAILValidate(Sender: TField);
    procedure FDDProfissionalNU_CPFValidate(Sender: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovaHabilidadeClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure dtsProfissionalStateChange(Sender: TObject);
    procedure FDDProfissionalBeforePost(DataSet: TDataSet);
    procedure FDDProfissionalAfterEdit(DataSet: TDataSet);
    procedure FDDProfissionalNewRecord(DataSet: TDataSet);
    procedure FDDProfissionalAfterScroll(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    aPersistence : TPersistence;
    aFactory     : TFactory;
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
  FrmProfissional: TFrmProfissional;

implementation

{$R *.dfm}

uses
  uDMConexao, ProfissionalServico;

procedure TFrmProfissional.AdicionarCamposPesquisa;
var
  wIndex : Integer;
begin
  try
    wIndex         := 0;
    Tabela         := 'PROFISSIONAL';
    CamposPesquisa := TObjectList<TCamposPesquisa>.Create;
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'CO_PROFISSIONAL';
    CamposPesquisa[wIndex].Descricao := 'Código';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_PROFISSIONAL';
    CamposPesquisa[wIndex].Descricao := 'Nome';

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

procedure TFrmProfissional.btnAlternarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 0;
  pcPrincipalChange(Sender);
end;

procedure TFrmProfissional.btnCancelarClick(Sender: TObject);
begin
  aPersistence.Cancelar(FDDProfissional);
end;

procedure TFrmProfissional.btnEditarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Editar(FDDProfissional);
end;

procedure TFrmProfissional.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
    aPersistence.Excluir(FDDProfissional);
end;

procedure TFrmProfissional.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmProfissional.btnGravarClick(Sender: TObject);
begin
  aPersistence.Gravar(FDDProfissional);
end;

procedure TFrmProfissional.btnNovaHabilidadeClick(Sender: TObject);
begin
  FrmProfissionalServico := TFrmProfissionalServico.Create(nil);
  FrmProfissionalServico.pnlTitulo.Caption := 'Profissional: '+ FDDProfissionalNM_PROFISSIONAL.AsString;
  FrmProfissionalServico.co_profissional := FDDProfissionalCO_PROFISSIONAL.AsInteger;
  FrmProfissionalServico.btnNovoClick(Sender);
  FrmProfissionalServico.ShowModal;
  FreeAndNil(FrmProfissionalServico);
  FDQProfissionalServico.Refresh;
end;

procedure TFrmProfissional.btnNovoClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Incluir(FDDProfissional);
end;

procedure TFrmProfissional.btnPesquisaClick(Sender: TObject);
var
  wStrBuilder : TStringBuilder;
begin
  if String(edtValor.Text).IsEmpty then
  begin
    Application.MessageBox('Informe o valor a ser pesquisado.', 'Atenção', MB_OK+MB_ICONWARNING);
    edtValor.SetFocus;
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
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA AND ')
                       .AppendLine('  IN_SITUACAO = ' + QuotedStr('A'));
      end;

      1 : begin
            wStrBuilder.AppendLine('  WHERE ' + String(comboCampo.Items.Objects[comboCampo.ItemIndex]))
                       .AppendLine(' LIKE ' + QuotedStr(edtValor.Text + '%')  + ' AND ')
                       .AppendLine('  CO_EMPRESA = :CO_EMPRESA AND ')
                       .AppendLine('  IN_SITUACAO = ' + QuotedStr('A'));
      end;
    end;
    FDDProfissional.Connection := DMConexao.FDConexao;
    if not FDDProfissional.Connection.InTransaction then
      FDDProfissional.Connection.StartTransaction;
    FDDProfissional.SQL.Clear;
    FDDProfissional.SQL.Text   := wStrBuilder.ToString;
    try
      FDDProfissional.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
      FDDProfissional.Open;
      FDDProfissional.Connection.Commit;
      edtValor.Clear;
      edtValor.SetFocus;
    except
      on e : exception do
      begin
        FDDProfissional.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
  end;
end;

procedure TFrmProfissional.DBGrid1DblClick(Sender: TObject);
var
  wStrBuilder : TStringBuilder;
  wFDQuery : TFDQuery;
begin
  if Application.MessageBox('Confirma a exclusão desta habilidade do Profissional?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
  begin
    wStrBuilder         := TStringBuilder.Create;
    wFDQuery            := TFDQuery.Create(nil);
    wFDQuery.Connection := FDDProfissional.Connection;
    try
      wStrBuilder.AppendLine('DELETE FROM PROFISSIONAL_SERVICO ')
                 .AppendLine('  WHERE CO_PROFISSIONAL = :CO_PROFISSIONAL AND ')
                 .AppendLine('        CO_EMPRESA      = :CO_EMPRESA      AND ')
                 .AppendLine('        CO_SERVICO      = :CO_SERVICO;         ');

      wFDQuery.SQL.Text                                 := wStrBuilder.ToString;
      wFDQuery.ParamByName('CO_PROFISSIONAL').AsInteger := FDDProfissionalCO_PROFISSIONAL.AsInteger;
      wFDQuery.ParamByName('CO_EMPRESA').AsInteger      := FDDProfissionalCO_EMPRESA.AsInteger;
      wFDQuery.ParamByName('CO_SERVICO').AsInteger      := FDQProfissionalServicoCO_SERVICO.AsInteger;
      try
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
    finally
      FreeAndNil(wStrBuilder);
      FreeAndNil(wFDQuery);
    end;
    FDQProfissionalServico.Refresh;
  end;
end;

procedure TFrmProfissional.dtsProfissionalStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsProfissional);
  btnAlternar.Enabled := (not(dtsProfissional.DataSet.State in [dsEdit, dsInsert]));
end;

procedure TFrmProfissional.FDDProfissionalAfterEdit(DataSet: TDataSet);
begin
  FDDProfissionalDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDProfissional.Connection));
  FDDProfissionalCO_USUARIO.AsInteger    := TParametro.co_usuario;
end;

procedure TFrmProfissional.FDDProfissionalAfterScroll(DataSet: TDataSet);
begin
  FDQProfissionalServico.Close;
  FDQProfissionalServico.ParamByName('CO_EMPRESA').AsInteger     := FDDProfissionalCO_EMPRESA.AsInteger;
  FDQProfissionalServico.ParamByName('CO_PROFISSIONAL').AsInteger := FDDProfissionalCO_PROFISSIONAL.AsInteger;
  FDQProfissionalServico.Open;
end;

procedure TFrmProfissional.FDDProfissionalBeforePost(DataSet: TDataSet);
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

procedure TFrmProfissional.FDDProfissionalNewRecord(DataSet: TDataSet);
begin
  FDDProfissionalCO_EMPRESA.AsInteger := TParametro.co_empresa;
  FDDProfissionalCO_USUARIO.AsInteger := TParametro.co_usuario;
  FDDProfissionalIN_SITUACAO.AsString := 'A';
end;

procedure TFrmProfissional.FDDProfissionalNU_CEPValidate(Sender: TField);
var
  DadosCep : TDadosCep;
begin
  if FDDProfissional.State in [dsEdit, dsInsert] then
  begin
    if Length(Sender.Text) <> 8 then
    begin
      Application.MessageBox('O número do CEP informado não é válido, verifique!', 'Atenção', MB_OK+MB_ICONERROR);
      Sender.FocusControl;
      Exit;
    end;
    if aFactory.InternetState then
    begin
      DadosCep            := TJSON.JsonToObject<TDadosCep>(aFactory.GetCEP(Sender.Text).ToString);
      try
        FDDProfissionalTX_LOGRADOURO.AsString  := DadosCep.logradouro;
        FDDProfissionalTX_BAIRRO.AsString      := DadosCep.bairro;
        FDDProfissionalTX_COMPLEMENTO.AsString := DadosCep.complemento;
        FDDProfissionalCO_CIDADE.AsInteger     := DadosCep.ibge.ToInteger;
      finally
        FreeAndNil(DadosCep);
      end;
      FDDProfissionalNU_LOGRADOURO.FocusControl;
    end;
  end;
end;

procedure TFrmProfissional.FDDProfissionalNU_CPFValidate(Sender: TField);
var
  wStrBuilder : TStringBuilder;
  wFDQuery : TFDQuery;
begin
  if FDDProfissional.State in [dsEdit, dsInsert] then
  begin
    if not Sender.IsNull then
    begin
      if not aFactory.ValidateCPF(Sender.Text) then
      begin
        Application.MessageBox('O número do CPF informado não é válido, verifique!', 'Atenção', MB_OK+MB_ICONERROR);
        Sender.FocusControl;
        Exit;
      end;
    end;
  end;
  wStrBuilder := TStringBuilder.Create;
  wFDQuery    := TFDQuery.Create(nil);
  wFDQuery.Connection := FDDProfissional.Connection;
  try
    wStrBuilder.AppendLine('SELECT NU_CPF             ')
               .AppendLine('  FROM PROFISSIONAL       ')
               .AppendLine('  WHERE NU_CPF = :NU_CPF; ');

    wFDQuery.Open(wStrBuilder.ToString, [Sender.Text]);

    if wFDQuery.RecordCount > 0 then
    begin
      raise Exception.Create('Já há um cliente cadastrado com este número de CPF.');
    end;
  finally
    FreeAndNil(wStrBuilder);
    FreeAndNil(wFDQuery);
  end;
end;

procedure TFrmProfissional.FDDProfissionalTX_EMAILValidate(Sender: TField);
var
  RegEx: TRegEx;
begin
  RegEx.Create('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if not RegEx.Match(Sender.Text).Success then
    raise Exception.Create('O endereço de e-mail informado não é válido, verifique.');
end;

procedure TFrmProfissional.FormCreate(Sender: TObject);
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

procedure TFrmProfissional.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
  FreeAndNil(FCamposPesquisa);
end;

procedure TFrmProfissional.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmProfissional.FormShow(Sender: TObject);
begin
  pcPrincipal.ActivePage := tabConsulta;
  edtValor.SetFocus;
  pnlTitulo.Caption      := Self.Caption;
  FDQCidade.Open;
  FDQHorario.Close;
  FDQHorario.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
  FDQHorario.Open;
  FDMSituacao.Open;
  pcPrincipalChange(Sender);
  AdicionarCamposPesquisa
end;

procedure TFrmProfissional.GridDblClick(Sender: TObject);
begin
  if dtsProfissional.DataSet.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmProfissional.pcPrincipalChange(Sender: TObject);
begin
  btnAlternar.Visible := pcPrincipal.ActivePageIndex = 1;
  btnAlternar.Enabled := pcPrincipal.ActivePageIndex = 1;
end;


procedure TFrmProfissional.SetCamposPesquisa(
  const Value: TObjectList<TCamposPesquisa>);
begin
  FCamposPesquisa := Value;
end;

procedure TFrmProfissional.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

end.
