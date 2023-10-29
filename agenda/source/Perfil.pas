unit Perfil;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.CommCtrl,
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
  Factory,
  Parametros,
  Persistence,
  CamposPesquisa,
  PraButtonStyle,
  CheckBox.Interpose,
  GroupBox.Interpose;

type
  TPosicaoBotoes = (tNovo = 3, tEditar = 57, tExcluir = 111, tGravar = 165, tCancelar = 219, tAlteranr = 301);
  TFrmPerfil = class(TForm)
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    dtsPerfil: TDataSource;
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
    FDDPerfil: TFDQuery;
    FDDPerfilCO_PERFIL: TIntegerField;
    FDDPerfilCO_USUARIO: TIntegerField;
    FDDPerfilCO_EMPRESA: TIntegerField;
    FDDPerfilNM_PERFIL: TStringField;
    FDDPerfilDT_ALTERACAO: TSQLTimeStampField;
    Label4: TLabel;
    CO_PERFIL: TDBEdit;
    Label5: TLabel;
    NM_PERFIL: TDBEdit;
    gbAcessos: TGroupBox;
    tvAcessos: TTreeView;
    btnExpandirArvore: TPraButtonStyle;
    btnMarcarTodos: TPraButtonStyle;
    btnAtualizarAcessos: TPraButtonStyle;
    procedure btnAlternarClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure dtsPerfilStateChange(Sender: TObject);
    procedure FDDPerfilAfterEdit(DataSet: TDataSet);
    procedure FDDPerfilBeforePost(DataSet: TDataSet);
    procedure FDDPerfilNewRecord(DataSet: TDataSet);
    procedure FDDPerfilAfterPost(DataSet: TDataSet);
    procedure btnExpandirArvoreClick(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure btnAtualizarAcessosClick(Sender: TObject);
    procedure tvAcessosClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    aPersistence : TPersistence;
    aFactory : TFactory;
    aAlterouAcessos : Boolean;
    FCamposPesquisa: TObjectList<TCamposPesquisa>;
    FTabela: String;
    procedure SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
    procedure SetTabela(const Value: String);
    property CamposPesquisa : TObjectList<TCamposPesquisa> read FCamposPesquisa write SetCamposPesquisa;
    property Tabela : String read FTabela write SetTabela;
    procedure AdicionarCamposPesquisa;
    procedure CarregarAcessos(aTreeView : TTreeView; aPerfil : Integer);
    procedure AtualizarAcesso(aTreeView : TTreeView; aPerfil : Integer);
  public
    { Public declarations }
  end;

var
  FrmPerfil: TFrmPerfil;

implementation

{$R *.dfm}

uses
  uDMConexao;

procedure TFrmPerfil.AdicionarCamposPesquisa;
var
  wIndex : Integer;
begin
  try
    wIndex         := 0;
    Tabela         := 'UC_PERFIL';
    CamposPesquisa := TObjectList<TCamposPesquisa>.Create;
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'CO_PERFIL';
    CamposPesquisa[wIndex].Descricao := 'Código';
    Inc(wIndex);
    CamposPesquisa.Add(TCamposPesquisa.Create);
    CamposPesquisa[wIndex].Campo     := 'NM_PERFIL';
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

procedure TFrmPerfil.AtualizarAcesso(aTreeView: TTreeView; aPerfil: Integer);
var
  aNode : TTreeNode;
  aFDQuery : TFDQuery;
  aStrBuilder : TStringBuilder;
begin
  aFDQuery            := TFDQuery.Create(nil);
  aFDQuery.Connection := DMConexao.FDConexao;
  aStrBuilder         := TStringBuilder.Create;
  aAlterouAcessos     := False;
  try
    aStrBuilder.AppendLine('UPDATE UC_PERFIL_ACAO              ')
               .AppendLine('  SET IN_ATIVA = :IN_ATIVA         ')
               .AppendLine('  WHERE CO_PERFIL = :CO_PERFIL AND ')
               .AppendLine('        CO_ACAO   = :CO_ACAO;      ');

    aFDQuery.SQL.Text := aStrBuilder.ToString;

    for aNode in aTreeView.Items do
    begin
      if (aNode.Text <> 'Menu') then
      begin
        if aNode.StateIndex = 2 then //Liberado
        begin
          aFDQuery.ParamByName('IN_ATIVA').AsBoolean  := True;
          aFDQuery.ParamByName('CO_PERFIL').AsInteger := aPerfil;
          aFDQuery.ParamByName('CO_ACAO').AsInteger   := Integer(aNode.Data);
          try
            aFDQuery.ExecSQL;
            aFDQuery.Connection.Commit;
          except
            on e : Exception do
            begin
              aFDQuery.Connection.Rollback;
              raise Exception.Create(e.Message);
            end;
          end;
        end
        else
        begin
          aFDQuery.ParamByName('IN_ATIVA').AsBoolean  := False;
          aFDQuery.ParamByName('CO_PERFIL').AsInteger := aPerfil;
          aFDQuery.ParamByName('CO_ACAO').AsInteger   := Integer(aNode.Data);
          try
            aFDQuery.ExecSQL;
            aFDQuery.Connection.Commit;
          except
            on e : Exception do
            begin
              aFDQuery.Connection.Rollback;
              raise Exception.Create(e.Message);
            end;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(aStrBuilder);
    FreeAndNil(aFDQuery);
  end;
end;

procedure TFrmPerfil.btnAlternarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 0;
  pcPrincipalChange(Sender);
end;

procedure TFrmPerfil.btnAtualizarAcessosClick(Sender: TObject);
begin
  btnAtualizarAcessos.Visible := False;
  AtualizarAcesso(tvAcessos, FDDPerfilCO_PERFIL.AsInteger);
end;

procedure TFrmPerfil.btnCancelarClick(Sender: TObject);
begin
  aPersistence.Cancelar(FDDPerfil);
end;

procedure TFrmPerfil.btnEditarClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  aPersistence.Editar(FDDPerfil);
  pcPrincipalChange(Sender);
end;

procedure TFrmPerfil.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
    aPersistence.Excluir(FDDPerfil);
end;

procedure TFrmPerfil.btnExpandirArvoreClick(Sender: TObject);
var
  aIndex : Integer;
begin
  if btnExpandirArvore.Caption = 'Expandir Árvore' then
  begin
    for aIndex := 0 to Pred(tvAcessos.Items.Count) do
      tvAcessos.Items[aIndex].Expand(True);
    btnExpandirArvore.Caption := 'Recolher Árvore'
  end else if btnExpandirArvore.Caption = 'Recolher Árvore' then
  begin
    for aIndex := 0 to Pred(tvAcessos.Items.Count) do
      tvAcessos.Items[aIndex].Collapse(True);
    btnExpandirArvore.Caption := 'Expandir Árvore'
  end;
end;

procedure TFrmPerfil.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmPerfil.btnGravarClick(Sender: TObject);
begin
  aPersistence.Gravar(FDDPerfil);
  FDDPerfil.RefreshRecord();
end;

procedure TFrmPerfil.btnMarcarTodosClick(Sender: TObject);
begin
  btnAtualizarAcessos.Visible := True;
  if btnMarcarTodos.Caption = 'Marcar todos' then
  begin
    aFactory.MarkAllTreeViewNodes(tvAcessos);
    btnMarcarTodos.Caption := 'Desmarcar todos';
  end else if btnMarcarTodos.Caption = 'Desmarcar todos' then
  begin
    aFactory.UnMarkAllTreeViewNodes(tvAcessos);
    btnMarcarTodos.Caption := 'Marcar todos';
  end;
end;

procedure TFrmPerfil.btnNovoClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
  aPersistence.Incluir(FDDPerfil);
end;

procedure TFrmPerfil.btnPesquisaClick(Sender: TObject);
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
    FDDPerfil.Connection := DMConexao.FDConexao;
    if not FDDPerfil.Connection.InTransaction then
      FDDPerfil.Connection.StartTransaction;
    FDDPerfil.SQL.Clear;
    FDDPerfil.SQL.Text   := wStrBuilder.ToString;
    try
      FDDPerfil.ParamByName('CO_EMPRESA').AsInteger := TParametro.co_empresa;
      FDDPerfil.Open;
      FDDPerfil.Connection.Commit;
      edtValor.Clear;
      edtValor.SetFocus;
    except
      on e : exception do
      begin
        FDDPerfil.Connection.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(wStrBuilder);
  end;
end;

procedure TFrmPerfil.CarregarAcessos(aTreeView: TTreeView; aPerfil: Integer);
var
  aFDQuery : TFDQuery;
  aStrBuilder : TStringBuilder;
  aRoot, aFather, aChild : TTreeNode;
  aCatAtual, aCatAnterior : Integer;
begin
  aFDQuery            := TFDQuery.Create(nil);
  aFDQuery.Connection := DMConexao.FDConexao;
  aStrBuilder         := TStringBuilder.Create;
  try
    aStrBuilder.AppendLine('SELECT C.CO_CATEGORIA, C.NM_CATEGORIA, PA.CO_ACAO, A.NM_ACAO, ')
               .AppendLine('       A.NM_ACAO_CAPTION, PA.IN_ATIVA                         ')
               .AppendLine('  FROM UC_PERFIL_ACAO PA                                      ')
               .AppendLine('    JOIN UC_ACAO A ON (A.CO_ACAO = PA.CO_ACAO)                ')
               .AppendLine('    JOIN UC_CATEGORIA C ON (C.CO_CATEGORIA = A.CO_CATEGORIA)  ')
               .AppendLine('  WHERE PA.CO_PERFIL = :CO_PERFIL                             ')
               .AppendLine('  ORDER BY C.NM_CATEGORIA, A.NM_ACAO_CAPTION;                 ');

    aFDQuery.Open(aStrBuilder.ToString, [aPerfil]);
    tvAcessos.Items.BeginUpdate;
    aRoot           := aTreeView.Items.Add(nil, 'Menu'); //Cria o nó raiz.
    aCatAtual       := aFDQuery.FieldByName('CO_CATEGORIA').AsInteger;
    aCatAnterior    := 0;
    aAlterouAcessos := False;
    while not aFDQuery.Eof do
    begin
      aCatAtual := aFDQuery.FieldByName('CO_CATEGORIA').AsInteger;
      if aCatAtual <> aCatAnterior then
      begin
        aFather := aTreeView.Items.Add(aRoot, aFDQuery.FieldByName('NM_CATEGORIA').AsString); //Adiciona o nó pai
        aChild  := aTreeView.Items.AddChildObject(aFather, aFDQuery.FieldByName('NM_ACAO_CAPTION').AsString, TObject(aFDQuery.FieldByName('CO_ACAO').AsInteger)); //adiciona o filho
        if aFDQuery.FieldByName('IN_ATIVA').AsBoolean = True then
        begin
          aChild.StateIndex := 2;
          aFactory.SetChecked(aChild, True);
        end;
      end else begin
        aChild  := aTreeView.Items.AddChildObject(aFather, aFDQuery.FieldByName('NM_ACAO_CAPTION').AsString, TObject(aFDQuery.FieldByName('CO_ACAO').AsInteger)); //adiciona o filho
        if aFDQuery.FieldByName('IN_ATIVA').AsBoolean = True then
        begin
          aChild.StateIndex := 2;
          aFactory.SetChecked(aChild, True);
        end;
      end;
      aCatAnterior := aCatAtual;
      aFDQuery.Next;
    end;
    btnExpandirArvoreClick(Self);
    tvAcessos.Items.EndUpdate;
  finally
    FreeAndNil(aFDQuery);
    FreeAndNil(aStrBuilder);
  end;
end;

procedure TFrmPerfil.dtsPerfilStateChange(Sender: TObject);
begin
  aFactory.HabDesBotoes(btnNovo, btnEditar, btnExcluir, btnGravar, btnCancelar, btnFechar, dtsPerfil);
end;

procedure TFrmPerfil.FDDPerfilAfterEdit(DataSet: TDataSet);
begin
  FDDPerfilDT_ALTERACAO.AsDateTime := aFactory.GetCurrentTimeStamp(TFDConnection(FDDPerfil.Connection));
  FDDPerfilCO_USUARIO.AsInteger    := TParametro.co_usuario;
end;

procedure TFrmPerfil.FDDPerfilAfterPost(DataSet: TDataSet);
begin
  if DataSet.State in [dsInsert] then
  begin
    CarregarAcessos(tvAcessos, FDDPerfilCO_PERFIL.AsInteger);
    gbAcessos.Visible := True;
  end;
end;

procedure TFrmPerfil.FDDPerfilBeforePost(DataSet: TDataSet);
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

procedure TFrmPerfil.FDDPerfilNewRecord(DataSet: TDataSet);
begin
  FDDPerfilCO_EMPRESA.AsInteger := TParametro.co_empresa;
  FDDPerfilCO_USUARIO.AsInteger := TParametro.co_usuario;
end;

procedure TFrmPerfil.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if aAlterouAcessos then
    CanClose := Application.MessageBox('Houveram alterações nos acessos deste Perfil, '+
                                       'e você ainda não gravou. Deseja cancelar?',
                                       'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING) = IDYES;
end;

procedure TFrmPerfil.FormCreate(Sender: TObject);
begin
  Brush.Style := bsClear;
  SetWindowLong(tvAcessos.Handle, GWL_STYLE, GetWindowLong(tvAcessos.Handle, GWL_STYLE) or TVS_CHECKBOXES);
  comboCondicao.ItemIndex               := 0;
  btnMarcarTodos.Width                  := 105;
  btnMarcarTodos.FontDisabled.Size      := 8;
  btnMarcarTodos.FontDown.Size          := 8;
  btnMarcarTodos.FontFocused.Size       := 8;
  btnMarcarTodos.Font.Size              := 8;
  btnExpandirArvore.Width               := 114;
  btnExpandirArvore.FontDisabled.Size   := 8;
  btnExpandirArvore.FontDown.Size       := 8;
  btnExpandirArvore.FontFocused.Size    := 8;
  btnExpandirArvore.Font.Size           := 8;
  btnAtualizarAcessos.Width             := 115;
  btnAtualizarAcessos.FontDisabled.Size := 8;
  btnAtualizarAcessos.FontDown.Size     := 8;
  btnAtualizarAcessos.FontFocused.Size  := 8;
  btnAtualizarAcessos.Font.Size         := 8;
  btnNovo.Left                          := Integer(tNovo);
  btnEditar.Left                        := Integer(tEditar);
  btnExcluir.Left                       := Integer(tExcluir);
  btnGravar.Left                        := Integer(tGravar);
  btnCancelar.Left                      := Integer(tCancelar);
  btnAlternar.Left                      := 285;//Integer(tAlteranr);
  btnNovo.Brush.Color                   := $00FE6F2C;
  btnNovo.BrushDown.Color               := btnNovo.Brush.Color;
  btnNovo.BrushFocused.Color            := btnNovo.Brush.Color;
  btnNovo.BrushDisabled.Color           := btnNovo.Brush.Color;
  btnEditar.Brush.Color                 := $0068625A;
  btnEditar.BrushDown.Color             := btnEditar.Brush.Color;
  btnEditar.BrushFocused.Color          := btnEditar.Brush.Color;
  btnEditar.BrushDisabled.Color         := btnEditar.Brush.Color;
  btnExcluir.Brush.Color                := $003626C6;
  btnExcluir.BrushDown.Color            := btnExcluir.Brush.Color;
  btnExcluir.BrushFocused.Color         := btnExcluir.Brush.Color;
  btnExcluir.BrushDisabled.Color        := btnExcluir.Brush.Color;
  btnGravar.Brush.Color                 := $00388A22;
  btnGravar.BrushDown.Color             := btnGravar.Brush.Color;
  btnGravar.BrushFocused.Color          := btnGravar.Brush.Color;
  btnGravar.BrushDisabled.Color         := btnGravar.Brush.Color;
  btnCancelar.Brush.Color               := $000FACDE;
  btnCancelar.BrushDown.Color           := btnCancelar.Brush.Color;
  btnCancelar.BrushFocused.Color        := btnCancelar.Brush.Color;
  btnCancelar.BrushDisabled.Color       := btnCancelar.Brush.Color;
  btnFechar.Brush.Color                 := $00978420;
  btnFechar.BrushDown.Color             := btnFechar.Brush.Color;
  btnFechar.BrushFocused.Color          := btnFechar.Brush.Color;
  btnFechar.BrushDisabled.Color         := btnFechar.Brush.Color;
  btnAlternar.Brush.Color               := $00E5E0DA;
  btnAlternar.BrushDown.Color           := btnAlternar.Brush.Color;
  btnAlternar.BrushFocused.Color        := btnAlternar.Brush.Color;
  btnAlternar.BrushDisabled.Color       := btnAlternar.Brush.Color;
  aPersistence                          := TPersistence.Create;
  aFactory                              := TFactory.Create;
end;

procedure TFrmPerfil.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aPersistence);
  FreeAndNil(aFactory);
  FreeAndNil(FCamposPesquisa);
end;

procedure TFrmPerfil.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrmPerfil.FormShow(Sender: TObject);
begin
  pcPrincipal.ActivePage := tabConsulta;
  pnlTitulo.Caption      := Self.Caption;
  pcPrincipalChange(Sender);
  AdicionarCamposPesquisa;
end;

procedure TFrmPerfil.GridDblClick(Sender: TObject);
begin
  if FDDPerfil.IsEmpty then
    Abort;
  pcPrincipal.ActivePageIndex := 1;
  pcPrincipalChange(Sender);
end;

procedure TFrmPerfil.pcPrincipalChange(Sender: TObject);
begin
  case pcPrincipal.ActivePageIndex of
    0 : begin
          edtValor.SetFocus;
          gbAcessos.Visible := False;
        end;
    1 : begin
          NM_PERFIL.SetFocus;
          if not FDDPerfil.IsEmpty then
          begin
            if (FDDPerfil.State in [dsBrowse]) then
            begin
              CarregarAcessos(tvAcessos, FDDPerfilCO_PERFIL.AsInteger);
              gbAcessos.Visible := True;
            end;
          end;
        end;
  end;

  btnAlternar.Visible := pcPrincipal.ActivePageIndex = 1;
  btnAlternar.Enabled := pcPrincipal.ActivePageIndex = 1;
end;


procedure TFrmPerfil.SetCamposPesquisa(const Value: TObjectList<TCamposPesquisa>);
begin
  FCamposPesquisa := Value;
end;

procedure TFrmPerfil.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

procedure TFrmPerfil.tvAcessosClick(Sender: TObject);
var
  aIndex : Integer;
  aChild: TTreeNode;
begin
  for aIndex := 0 to Pred(tvAcessos.Items.Count) do
  begin
    if (tvAcessos.Items[aIndex].Level = 0) and (tvAcessos.Items[aIndex].Text <> 'Menu') then
    begin
      if (tvAcessos.Items[aIndex].Count > 0) and (aFactory.IsChecked(tvAcessos.Items[aIndex])) then
      begin
        aFactory.SetChecked(tvAcessos.Items[aIndex], False);
        aChild                      := tvAcessos.Items[aIndex].getFirstChild;
        aAlterouAcessos             := True;
        btnAtualizarAcessos.Visible := True;
        while aChild <> nil do
        begin
          aChild.StateIndex := 2;
          aFactory.SetChecked(aChild, True);
          aChild := tvAcessos.Items[aIndex].GetNextChild(aChild);
        end;
      end;
    end else if aFactory.IsChecked(tvAcessos.Items[aIndex]) then
    begin
      tvAcessos.Items[aIndex].StateIndex := 2;
      aAlterouAcessos             := True;
      btnAtualizarAcessos.Visible := True;
    end else begin
      tvAcessos.Items[aIndex].StateIndex := 1;
      aAlterouAcessos             := True;
      btnAtualizarAcessos.Visible := True;
    end;
  end;
end;

end.
