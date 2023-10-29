unit Factory;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.WinInet,
  Winapi.CommCtrl,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.Hash,
  System.NetEncoding,
  System.Net.HttpClient,
  System.Generics.Collections,
  System.DateUtils,
  System.RegularExpressions,
  System.Win.Registry,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ActnMan,
  Vcl.Imaging.Jpeg,
  Vcl.Buttons,
  Vcl.WinXCtrls,
  Vcl.CategoryButtons,
  Vcl.StdCtrls,
  Vcl.ActnList,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  Data.DB,
  Data.Bind.ObjectScope,
  Data.Bind.Components,
  REST.Types,
  REST.Client,
  PraButtonStyle;

type
  THoratios = class
  private
    Fentrada1: TTime;
    Fsaida2: TTime;
    Fsaida1: TTime;
    Fdia: Integer;
    Fentrada2: TTime;
    procedure Setdia(const Value: Integer);
    procedure Setentrada1(const Value: TTime);
    procedure Setentrada2(const Value: TTime);
    procedure Setsaida1(const Value: TTime);
    procedure Setsaida2(const Value: TTime);
  public
    property dia : Integer read Fdia write Setdia;
    property entrada1 : TTime read Fentrada1 write Setentrada1;
    property saida1 : TTime read Fsaida1 write Setsaida1;
    property entrada2 : TTime read Fentrada2 write Setentrada2;
    property saida2 : TTime read Fsaida2 write Setsaida2;
  end;

  TAgenda = class
  private
    Fhorario: TTime;
    Fdata: TDate;
    procedure Setdata(const Value: TDate);
    procedure Sethorario(const Value: TTime);
  public
    property data : TDate read Fdata write Setdata;
    property horario : TTime read Fhorario write Sethorario;
  end;

  TFactory = class(TObject)
  private
    RestClient   : TRestClient;
    RestRequest  : TRestRequest;
    RestResponse : TRestResponse;
  public
    function ValidateCNPJ(const aValue : String) : Boolean;
    function ValidateCPF(const aValue : String) : Boolean;
    function GetCEP(const aValue : String) : TJSONValue;
    function GetVersionInfo(AValue: String): String;
    procedure HabDesBotoes(Novo, Editar, Excluir, Gravar, Cancelar, Fechar : TPraButtonStyle; DataSource : TDataSource);
    procedure OcultarSubMenu(AForm : TForm);
    procedure FecharMenu(AForm : TForm; ASplitView : TSplitView);
    function Cripto(Action, Src, Key: String): String;
    function InternetState : Boolean;
    function GetCurrentTimeStamp(aValue : TFDConnection) : TDateTime;
    function GetValorNoArray(aValue : Integer; aLista : array of Integer) : Boolean;
    function ValidaCamposObrigatorios(aValue : TDataSet) : TStrings;
    function GerarAgenda(const aProfissional, aMes, aAno : Integer; const aIntervalo : TTime;
                         const aHorarios : TObjectList<THoratios>; const aFeriados : TArray<Integer>) : TObjectList<TAgenda>;
    function GetTimeInMinutes(aValue : TTime) : Integer;
    function GetFirstLastDayToMonth(aValue : TFDConnection) : TArray<TDateTime>;
    function GetStrHashSHA512_256(aValue: String): String;
    function StrongPassword(aValue : String) : Boolean;
    function ValidarEmail(aValue : String) : Boolean;
    function SugerirNomeUser(aValue : String) : String;
    function RemoverCaracteresEspeciais(aValue : String) : String;
    function IsChecked(aNode : TTreeNode) : Boolean;
    function GetCurrentYear(aConnection : TFDConnection) : Integer;
    function GetDirectoryApp : String;
    function GetFirebirdInstallDir: string;
    function Get7zipInstallDir: string;
    function GetDriveLetters: TArray<string>;
    procedure SetCategoria(aAction : TActionManager; aConnection : TFDConnection); overload;
    procedure SetAcao(aAction : TActionManager; aConnection : TFDConnection); overload;
    procedure SetCategoria(aAction : TActionList; aConnection : TFDConnection); overload;
    procedure SetAcao(aAction : TActionList; aConnection : TFDConnection); overload;
    procedure SetLoginAdm(aConnection : TFDConnection);
    procedure ArredondarCantosControle(aControl: TWinControl);
    procedure SetChecked(aNode :TTreeNode; aChecked: Boolean);
    procedure MarkAllNodes(aNode: TTreeNode);
    procedure MarkAllTreeViewNodes(aTreeView: TTreeView);
    procedure UnMarkAllNodes(aNode: TTreeNode);
    procedure UnMarkAllTreeViewNodes(aTreeView: TTreeView);
    procedure GetDosOutput(pCommandLine: string; pMemo : TMemo);
    constructor Create;
    destructor Destroy; override;
  end;

const
  TVIS_CHECKED  = $2000;
  TVIS_UNCHECKED= $1000;

implementation

uses
  System.IOUtils, Winapi.ShellAPI;

{ TFactory }

procedure TFactory.ArredondarCantosControle(aControl: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  R   := aControl.ClientRect;
  rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 10, 10);
  aControl.Perform(EM_GETRECT, 0, lParam(@r));
  InflateRect(r, - 5, - 5);
  aControl.Perform(EM_SETRECTNP, 0, lParam(@r));
  SetWindowRgn(aControl.Handle, rgn, True);
  aControl.Invalidate;
end;

constructor TFactory.Create;
begin
  RestClient   := TRestClient.Create(nil);
  RestRequest  := TRestRequest.Create(nil);
  RestResponse := TRestResponse.Create(nil);
end;

function TFactory.Cripto(Action, Src, Key: String): String;
var
  SrcPos,
  SrcAsc,
  TmpSrcAsc,
  Range,
  KeyLen,
  KeyPos,
  offset : Integer;
  dest : String;
begin
  dest   := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  Range  := 256;
  if Action=UpperCase('E') then
  begin
    Randomize;
    offset := Random(Range);
    dest   := format('%1.2x',[offset]);
    for SrcPos := 1 to Length(Src) do
    begin
      SrcAsc := (Ord(Src[SrcPos])+offset) mod 255;
      if KeyPos<KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
      dest   := dest+format('%1.2x',[SrcAsc]);
      offset := SrcAsc;
    end;
  end else if Action=UpperCase('D') then
  begin
    offset :=StrToInt('$'+ copy(src,1,2));
    SrcPos :=3;
    repeat
      SrcAsc := StrToInt('$'+ copy(src,SrcPos,2));
      if KeyPos<KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= offset then
        TmpSrcAsc := 255 + TmpSrcAsc - offset
      else
        TmpSrcAsc := TmpSrcAsc - offset;
      dest   := dest + chr(TmpSrcAsc);
      offset := srcAsc;
      SrcPos := SrcPos + 2;
    until SrcPos >= Length(Src);
  end;
  Result := dest;
end;

destructor TFactory.Destroy;
begin
  FreeAndNil(RestClient);
  FreeAndNil(RestRequest);
  FreeAndNil(RestResponse);
end;

procedure TFactory.FecharMenu(AForm: TForm; ASplitView: TSplitView);
begin
  if AForm.MDIChildCount = 0 then
  begin
    ASplitView.Close;
  end;
end;

function TFactory.GerarAgenda(const aProfissional, aMes, aAno: Integer; const aIntervalo : TTime;
                              const aHorarios: TObjectList<THoratios>; const aFeriados: TArray<Integer>): TObjectList<TAgenda>;
var
  wAgenda : TAgenda;
  wEntrada1, wSaida1, wEntrada2, wSaida2 , wHorarioCalculado: TTime;
  wDataInicial : TDate;
  wDiaDaSemana, wDiaDaData, wQtdeDiasMes, wIndex, wIntervalo : Integer;
begin
  Result    := TObjectList<TAgenda>.Create;

  wEntrada1 := StrToTime('00:00');
  wEntrada2 := StrToTime('00:00');
  wSaida1   := StrToTime('00:00');
  wSaida2   := StrToTime('00:00');

  //Dias da semana 1 - Domingo, 2 - Segunda, 3 - Terça, 4 - Quarta, 5 - Quinta, 6 - Sexta, 7 - Sabado
  wDataInicial := StrToDate('01/'+aMes.ToString+'/'+aAno.ToString);
  wQtdeDiasMes := DaysInMonth(wDataInicial);
  wIntervalo   := GetTimeInMinutes(aIntervalo);
  while wQtdeDiasMes > 0 do
  begin

    wDiaDaSemana := DayOfWeek(wDataInicial);
    wDiaDaData   := DayOf(wDataInicial);

    if not GetValorNoArray(wDiaDaData, aFeriados) then //Verifica se é feriado
    begin


      for wIndex := 0 to Pred(aHorarios.Count) do
      begin
        if aHorarios[wIndex].dia = wDiaDaSemana then //Verifica se o profissional atende neste dia.
        begin
          wEntrada1 := aHorarios[wIndex].entrada1;
          wSaida1   := aHorarios[wIndex].saida1;
          wEntrada2 := aHorarios[wIndex].entrada2;
          wSaida2   := aHorarios[wIndex].saida2;
          Break;
        end;
      end;

      wHorarioCalculado := wEntrada1;
      if ((wEntrada1 > 0) and (wSaida1 > 0)) then //Calcula horários do primeiro período
      begin
        while (wHorarioCalculado <= wSaida1) do
        begin
          wAgenda           := TAgenda.Create;
          wAgenda.data      := wDataInicial;
          wAgenda.horario   := wHorarioCalculado;
          wHorarioCalculado := IncMinute(wHorarioCalculado, wIntervalo);
          Result.Add(wAgenda);
        end;
      end;

      wHorarioCalculado := wEntrada2;
      if ((wEntrada2 > 0) and (wSaida2 > 0)) then //Calcula horários do segundo período
      begin
        while (wHorarioCalculado <= wSaida2) do
        begin
          wAgenda           := TAgenda.Create;
          wAgenda.data      := wDataInicial;
          wAgenda.horario   := wHorarioCalculado;
          wHorarioCalculado := IncMinute(wHorarioCalculado, wIntervalo);
          Result.Add(wAgenda);
        end;
      end;
      wEntrada1 := StrToTime('00:00');
      wEntrada2 := StrToTime('00:00');
      wSaida1   := StrToTime('00:00');
      wSaida2   := StrToTime('00:00');
    end;
    wDataInicial := IncDay(wDataInicial, 1);
    Dec(wQtdeDiasMes);
  end;
end;

function TFactory.Get7zipInstallDir: string;
var
  I, Tamanho : Integer;
  DriveList, CommonPaths : TArray<string>;
  Drive : string;
begin
  Result    := '';
  Tamanho   := 0;
  DriveList := GetDriveLetters;

  for Drive in DriveList do
  begin
    Inc(Tamanho);
    SetLength(CommonPaths, Tamanho);
    CommonPaths[Tamanho-1] := Drive + 'Program Files\7-Zip';
    Inc(Tamanho);
    SetLength(CommonPaths, Tamanho);
    CommonPaths[Tamanho-1] := Drive + 'Program Files (x86)\7-Zip';
  end;

  for I := 0 to High(CommonPaths) do
  begin
    if DirectoryExists(CommonPaths[I]) then
    begin
      Result := CommonPaths[I];
      Break;
    end;
  end;

  Result := ExcludeTrailingPathDelimiter(Result);
end;

function TFactory.GetCEP(const aValue: String): TJSONValue;
begin
  Result       := nil;
  try
    if not aValue.IsEmpty then
    begin
      RestClient.BaseURL := 'http://viacep.com.br/ws/' + aValue + '/json';
      RestRequest.Client := RestClient;
      RestRequest.Method := rmGET;
      RestRequest.Response := RestResponse;
      RestRequest.Execute;
      Result := RestResponse.JSONValue;
    end;
  finally

  end;
end;

function TFactory.GetCurrentTimeStamp(aValue: TFDConnection): TDateTime;
var
  wFDQuery : TFDQuery;
  wStrBuilder : TStringBuilder;
begin
  wFDQuery            := TFDQuery.Create(nil);
  wFDQuery.Connection := aValue;
  wStrBuilder := TStringBuilder.Create('SELECT LOCALTIMESTAMP FROM RDB$DATABASE;');
  try
    wFDQuery.Open(wStrBuilder.ToString);
    Result := wFDQuery.FieldByName('LOCALTIMESTAMP').AsDateTime;
  finally
    FreeAndNil(wFDQuery);
    FreeAndNil(wStrBuilder);
  end;
end;

function TFactory.GetCurrentYear(aConnection: TFDConnection): Integer;
var
  aFDQuery : TFDQuery;
begin
  aFDQuery            := TFDQuery.Create(nil);
  aFDQuery.Connection := aConnection;
  try
    aFDQuery.Open('SELECT EXTRACT(YEAR FROM CURRENT_DATE) AS ANO_CORRENTE FROM RDB$DATABASE;');
    Result := aFDQuery.FieldByName('ANO_CORRENTE').AsInteger;
  finally
    FreeAndNil(aFDQuery);
  end;
end;

function TFactory.GetDirectoryApp: String;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TFactory.GetDosOutput(pCommandLine: string; pMemo: TMemo);
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  Handle: Boolean;
  WorkDir : String;
begin
  WorkDir := TPath.GetTempPath;
  SA.nLength              := SizeOf(SA);
  SA.bInheritHandle       := True;
  SA.lpSecurityDescriptor := nil;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    FillChar(SI, SizeOf(SI), 0);
    SI.cb          := SizeOf(TStartupInfo);
    SI.dwFlags     := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    SI.wShowWindow := SW_HIDE;
    SI.hStdInput   := StdOutPipeRead;
    SI.hStdOutput  := StdOutPipeWrite;
    SI.hStdError   := StdOutPipeWrite;
    FillChar(PI, SizeOf(PI), 0);

    Handle := CreateProcess(PChar(nil), PChar('cmd.exe /C ' + pCommandLine), nil, nil, True, 0, nil, PChar(WorkDir), SI, PI);

    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          Application.ProcessMessages;
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            pMemo.Text        := pMemo.Text + String(Buffer);
            pMemo.Perform(EM_LINESCROLL,0,pMemo.Lines.Count);
            Application.ProcessMessages;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;

function TFactory.GetDriveLetters: TArray<string>;
var
  DrivesBitMask: DWORD;
  DriveLetter: Char;
  DriveList: TArray<string>;
  I: Integer;
begin
  SetLength(DriveList, 0);

  DrivesBitMask := GetLogicalDrives;
  for DriveLetter := 'A' to 'Z' do
  begin
    if (DrivesBitMask and 1) = 1 then
      SetLength(DriveList, Length(DriveList) + 1)
    else
      SetLength(DriveList, Length(DriveList));

    DrivesBitMask := DrivesBitMask shr 1;
  end;

  I := 0;
  DrivesBitMask := GetLogicalDrives;
  for DriveLetter := 'A' to 'Z' do
  begin
    if (DrivesBitMask and 1) = 1 then
    begin
      DriveList[I] := DriveLetter + ':\';
      Inc(I);
    end;
    DrivesBitMask := DrivesBitMask shr 1;
  end;

  Result := DriveList;
end;

function TFactory.GetFirebirdInstallDir: string;
var
  I, Tamanho : Integer;
  DriveList, CommonPaths : TArray<string>;
  Drive : string;
begin
  Result    := '';
  Tamanho   := 0;
  DriveList := GetDriveLetters;

  for Drive in DriveList do
  begin
    Inc(Tamanho);
    SetLength(CommonPaths, Tamanho);
    CommonPaths[Tamanho-1] := Drive + 'Program Files\Firebird\Firebird_3_0';
    Inc(Tamanho);
    SetLength(CommonPaths, Tamanho);
    CommonPaths[Tamanho-1] := Drive + 'Program Files (x86)\Firebird\Firebird_3_0';
  end;

  for I := 0 to High(CommonPaths) do
  begin
    if DirectoryExists(CommonPaths[I]) then
    begin
      Result := CommonPaths[I];
      Break;
    end;
  end;

  Result := ExcludeTrailingPathDelimiter(Result);
end;

function TFactory.GetFirstLastDayToMonth(aValue: TFDConnection): TArray<TDateTime>;
var
  CurrentDay, FirstDay, LastDay : TDateTime;
  aDay, aMonth, aYear : Word;
begin
  SetLength(Result, 2);
  CurrentDay := GetCurrentTimeStamp(aValue);
  DecodeDate(CurrentDay, aYear, aMonth, aDay);
  FirstDay := StrToDate('01/' + FormatFloat('00', aMonth) + '/' + IntToStr(aYear));
  LastDay  := StrToDate(IntToStr(DaysInMonth(CurrentDay)) + '/' + FormatFloat('00', aMonth) + '/' + IntToStr(aYear));
  Result[0] := FirstDay;
  Result[1] := LastDay;
end;

function TFactory.GetStrHashSHA512_256(aValue: String): String;
var
  HashSHA: THashSHA2;
begin
    HashSHA := THashSHA2.Create;
    HashSHA.GetHashString(AValue);
    Result := HashSHA.GetHashString(AValue,SHA512_256);
end;

function TFactory.GetTimeInMinutes(aValue: TTime): Integer;
var
  wHoras, wMinutos, wSegundos, wMilesegundos : Word;
begin
  DecodeTime(aValue, wHoras, wMinutos, wSegundos, wMilesegundos);
  Result := (wHoras * 60) + wMinutos;
end;

function TFactory.GetValorNoArray(aValue: Integer; aLista: array of Integer): Boolean;
var
  aIndex : Integer;
begin
  Result := False;
  for aIndex := 0 to High(aLista) do
  begin
    if aLista[aIndex] = aValue then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TFactory.GetVersionInfo(AValue: String): String;
var
 VerInfoSize: DWORD;
 VerInfo: Pointer;
 VerValueSize: DWORD;
 VerValue: PVSFixedFileInfo;
 Dummy: DWORD;
 V1, V2, V3, V4: Word;
begin

   try

      VerInfoSize := GetFileVersionInfoSize(PChar(AValue), Dummy);
      GetMem(VerInfo, VerInfoSize);
      GetFileVersionInfo(PChar(AValue), 0, VerInfoSize, VerInfo);
      VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);

      with (VerValue^) do begin

         V1 := dwFileVersionMS shr 16;
         V2 := dwFileVersionMS and $FFFF;
         V3 := dwFileVersionLS shr 16;
         V4 := dwFileVersionLS and $FFFF;

      end;

      FreeMem(VerInfo, VerInfoSize);
      Result := Format('%d.%d.%d.%d', [v1, v2, v3, v4]);

   except

      Result := '1.0.0';

   end;

end;

procedure TFactory.HabDesBotoes(Novo, Editar, Excluir, Gravar, Cancelar, Fechar: TPraButtonStyle; DataSource: TDataSource);
begin
  Novo.Enabled     := (not(DataSource.DataSet.State in [dsEdit, dsInsert]));
  Editar.Enabled   := ((DataSource.DataSet.State in [dsBrowse]) and (DataSource.DataSet.RecordCount > 0));
  Excluir.Enabled  := ((DataSource.DataSet.State in [dsBrowse]) and (DataSource.DataSet.Active) and (DataSource.DataSet.RecordCount > 0) );
  Gravar.Enabled   := (DataSource.DataSet.State in [dsEdit, dsInsert]);
  Cancelar.Enabled := (DataSource.DataSet.State in [dsEdit, dsInsert]);
  Fechar.Enabled   := (DataSource.DataSet.State in [dsInactive, dsBrowse]);
end;

function TFactory.InternetState: Boolean;
var
  wHttp : THTTPClient;
begin
  wHttp := THTTPClient.Create;
  try
    Result := wHttp.Head('https://google.com').StatusCode < 400;
  finally
    FreeAndNil(wHttp);
  end;
end;

function TFactory.IsChecked(aNode: TTreeNode): Boolean;
var
  TVItem : TTVItem;
begin
  TVItem.mask  := TVIF_STATE;
  TVItem.hItem := aNode.ItemId;
  TreeView_GetItem(aNode.TreeView.Handle, TVItem);
  Result       := (TVItem.state and TVIS_CHECKED > 0);
end;

procedure TFactory.MarkAllNodes(aNode: TTreeNode);
var
  ChildNode: TTreeNode;
begin
  // Marcar o nó atual
  aNode.StateIndex := 2;

  // Percorrer todos os nós filhos
  ChildNode := aNode.GetFirstChild;
  while Assigned(ChildNode) do
  begin
    MarkAllNodes(ChildNode);
    ChildNode := ChildNode.GetNextSibling;
  end;
end;

procedure TFactory.MarkAllTreeViewNodes(aTreeView: TTreeView);
var
  Node: TTreeNode;
begin
  // Percorrer todos os nós do TreeView
  Node := aTreeView.Items.GetFirstNode;
  while Assigned(Node) do
  begin
    MarkAllNodes(Node);
    Node := Node.GetNextSibling;
  end;
end;

procedure TFactory.OcultarSubMenu(AForm: TForm);
var
  I: Integer;
begin
  for I := 0 to Pred(AForm.ComponentCount) do
  begin
    if AForm.Components[I] is TCategoryButtons then
    begin
      if TCategoryButtons(AForm.Components[I]).Name <> 'cbMenuItens' then
      begin
        TCategoryButtons(AForm.Components[I]).Visible := False;
      end;
    end;
  end;
end;

function TFactory.RemoverCaracteresEspeciais(aValue: String): String;
const
  Acentos   = 'áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙäëïöüÄËÏÖÜãõÃÕâêîôûÂÊÎÔÛçÇñÑ';
  Normais   = 'aeiouAEIOUaeiouAEIOUaeiouAEIOUaoAOaeiouAEIOUcCnN';
var
  a: Integer;
begin
  Result := '';
  for a := 1 to Length(aValue) do
  begin
    if Pos(aValue[a], Acentos) > 0 then
      Result := Result + Normais[Pos(aValue[a], Acentos)]
    else
      Result := Result + aValue[a];
  end;
end;

procedure TFactory.SetAcao(aAction: TActionManager; aConnection: TFDConnection);
var
  aFDQuery : TFDQuery;
  aIndex : Integer;
  aCO_Category : String;
begin
  aFDQuery := TFDQuery.Create(nil);
  aFDQuery.Connection := aConnection;
  try
    for aIndex := 0 to Pred(aAction.ActionCount) do begin

      if EmptyStr = '' then

      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Text :=
        'SELECT CO_CATEGORIA FROM UC_CATEGORIA WHERE NM_CATEGORIA = :NM_CATEGORIA ';
      aFDQuery.ParamByName('NM_CATEGORIA').AsString := aAction.Actions[aIndex].Category;
      aFDQuery.Open();

      aCO_Category := aFDQuery.Fields[0].AsString;

      aFDQuery.Close;
      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Text :=
        'INSERT INTO UC_ACAO (CO_ACAO, CO_CATEGORIA, NM_ACAO, NM_ACAO_CAPTION)        '+
        'VALUES (GEN_ID(INC_CO_ACAO, 1), :CO_CATEGORIA, :NM_ACAO, :NM_ACAO_CAPTION)';
      aFDQuery.ParamByName('CO_CATEGORIA').Value       := aCO_Category;
      aFDQuery.ParamByName('NM_ACAO').AsString         := aAction.Actions[aIndex].Name;
      aFDQuery.ParamByName('NM_ACAO_CAPTION').AsString := aAction.Actions[aIndex].Caption;;
      try
        aFDQuery.ExecSQL;
        aConnection.CommitRetaining;
      except
        on e : exception do begin
          aConnection.RollbackRetaining;
          raise Exception.Create(e.Message);
        end;
      end;
    end;
  finally
    FreeAndNil(aFDQuery);
  end;
end;

procedure TFactory.SetCategoria(aAction: TActionManager; aConnection: TFDConnection);
var
  aFDQuery : TFDQuery;
  aIndex : Integer;
  aListCategoria : TStringList;
begin
  aListCategoria            := TStringList.Create;
  aListCategoria.Sorted     := True;
  aListCategoria.Duplicates := dupIgnore;
  aFDQuery                  := TFDQuery.Create(nil);
  aFDQuery.Connection       := aConnection;
  try
    for aIndex := 0 to Pred(aAction.ActionCount) do begin
      aListCategoria.Add(aAction.Actions[aIndex].Category);
    end;
    for aIndex := 0 to aListCategoria.Count - 1 do begin
      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Text :=
        'INSERT INTO UC_CATEGORIA (CO_CATEGORIA, NM_CATEGORIA, IN_ATIVA) '+
        'VALUES (GEN_ID(INC_CO_CATEGORIA, 1), :NM_CATEGORIA, TRUE);     ';
      aFDQuery.ParamByName('NM_CATEGORIA').AsString := aListCategoria[aIndex];
      try
        aFDQuery.ExecSQL;
        AConnection.CommitRetaining;
      except
        on e : exception do begin
          AConnection.RollbackRetaining;
          raise Exception.Create(e.Message);
        end;
      end;
    end;
  finally
    FreeAndNil(aListCategoria);
    FreeAndNil(aFDQuery);
  end;
end;

function TFactory.ValidaCamposObrigatorios(aValue: TDataSet): TStrings;
var
  Field: TField;
begin
  Result := TStringList.Create;
  try
    for Field in aValue.Fields do
    begin
      if Field.Required and (Field.IsNull or (Field.Text = '')) then
      begin
        Result.Add(Field.DisplayLabel);
      end;
    end;
  finally

  end;
end;

function TFactory.ValidarEmail(aValue: String): Boolean;
var
  wExpressao : String;
begin
  wExpressao := '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$';
  Result := TRegex.IsMatch(aValue, wExpressao);
end;

function TFactory.ValidateCNPJ(const aValue: String): Boolean;
var
  posicao, codigo, i, soma2, dv, dv_informado : integer;
  digito : array[1..14] of byte;
begin
  Result := False;

  //DV_Informado - dois ultimos digitos de verificação
  val(copy(AValue, 13, 2), dv_informado, codigo);
  //Desmembra o número do CNPJ na matriz digito
  for i := 1 to 12 do
  begin
      val(copy(AValue, i, 1), digito[i], codigo);
  end;
  //Calcula o 13º digito de verificação
  posicao := 5;
  soma2   := 0;
  for i := 1 to 4 do
  begin
      soma2   := soma2 + digito[i] * posicao;
      posicao := posicao - 1;
  end;
  posicao := 9;
  for i := 5 to 12 do
  begin
      soma2   := soma2 + digito[i] * posicao;
      posicao := posicao - 1;
  end;
  digito[13] := soma2 mod 11;
  if (digito[13] < 2) then
      digito[13] := 0
  else
      digito[13] := 11 - digito[13];
  //Calcula o 14º digito de verificação
  posicao := 6;
  soma2 := 0;
  for i := 1 to 5 do
  begin
      soma2 := soma2 + digito[i] * posicao;
      posicao := posicao - 1;
  end;
  posicao := 9;
  for i := 6 to 13 do
  begin
      soma2 := soma2 + digito[i] * posicao;
      posicao := posicao - 1;
  end;
  digito[14] := soma2 mod 11;
  if (digito[14] < 2) then
      digito[14] := 0
  else
      digito[14] := 11 - digito[14];
  //Verifica se DV calculado é igual a DV_Informado
  dv := digito[13] * 10 + digito[14];
  if (dv = dv_informado) then begin
     Result := True;
  end;
end;

function TFactory.ValidateCPF(const aValue: String): Boolean;
var
  posicao, codigo, i, soma, dv, dv_informado : integer;
  digito : array[1..11] of byte;
begin
  // Retira do numero o dv_informado
  val(copy(AValue, 10, 2), dv_informado, codigo);
  // Desmembra o numero do CNPF na matriz digito
  for i:= 1 to 9 do
  begin
    val(copy(AValue, i, 1), digito[i], codigo);
  end;
  // Calcula o valor do 10º digito de verificacao
  posicao := 10;
  soma := 0;
  for i := 1 to 9 do
  begin
    soma := soma + digito[i] * posicao;
    posicao := posicao - 1;
  end;
  digito[10] := soma mod 11;
  if (digito[10] < 2) then
    digito[10] := 0
  else
    digito[10] := 11 - digito[10];
  // Calcula o 11º digito de verificacao
  posicao := 11;
  soma := 0;
  for i := 1 to 10 do
  begin
    soma    := soma + digito[i] * posicao;
    posicao := posicao - 1;
  end;
  digito[11] := soma mod 11;
  if (digito[11] < 2) then
    digito[11] := 0
  else
    digito[11] := 11 - digito[11];
  // Verifica se o DV calculado e igual ao informado (dv_informado)
  dv := digito[10] * 10 + digito[11];
  if (dv = dv_informado) then
    Result := True
  else
    Result := False
end;

procedure TFactory.SetAcao(aAction: TActionList; aConnection: TFDConnection);
var
  aFDQuery : TFDQuery;
  aIndex : Integer;
  aCO_Category : String;
begin
  aFDQuery := TFDQuery.Create(nil);
  aFDQuery.Connection := aConnection;
  try
    for aIndex := 0 to Pred(aAction.ActionCount) do
    begin
      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Text :=
        'SELECT CO_CATEGORIA FROM UC_CATEGORIA WHERE NM_CATEGORIA = :NM_CATEGORIA ';
      aFDQuery.ParamByName('NM_CATEGORIA').AsString := aAction.Actions[aIndex].Category;
      aFDQuery.Open();

      aCO_Category := aFDQuery.Fields[0].AsString;

      aFDQuery.Close;
      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Text :=
        'INSERT INTO UC_ACAO (CO_ACAO, CO_CATEGORIA, NM_ACAO, NM_ACAO_CAPTION)        '+
        'VALUES (GEN_ID(INC_CO_ACAO, 1), :CO_CATEGORIA, :NM_ACAO, :NM_ACAO_CAPTION)';
      aFDQuery.ParamByName('CO_CATEGORIA').Value       := aCO_Category;
      aFDQuery.ParamByName('NM_ACAO').AsString         := aAction.Actions[aIndex].Name;
      aFDQuery.ParamByName('NM_ACAO_CAPTION').AsString := aAction.Actions[aIndex].Caption;;
      try
        aFDQuery.ExecSQL;
        aConnection.CommitRetaining;
      except
        on e : exception do begin
          aConnection.RollbackRetaining;
          raise Exception.Create(e.Message);
        end;
      end;
    end;
  finally
    FreeAndNil(aFDQuery);
  end;
end;

procedure TFactory.SetCategoria(aAction: TActionList; aConnection: TFDConnection);
var
  aFDQuery : TFDQuery;
  aIndex : Integer;
  aListCategoria : TStringList;
begin
  aListCategoria            := TStringList.Create;
  aListCategoria.Sorted     := True;
  aListCategoria.Duplicates := dupIgnore;
  aFDQuery                  := TFDQuery.Create(nil);
  aFDQuery.Connection       := aConnection;
  try
    for aIndex := 0 to Pred(aAction.ActionCount) do
    begin
      if aAction.Actions[aIndex].Category <> '' then
        aListCategoria.Add(aAction.Actions[aIndex].Category);
    end;
    for aIndex := 0 to Pred(aListCategoria.Count) do
    begin
      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Text :=
        'INSERT INTO UC_CATEGORIA (CO_CATEGORIA, NM_CATEGORIA, IN_ATIVA) '+
        'VALUES (GEN_ID(INC_CO_CATEGORIA, 1), :NM_CATEGORIA, TRUE);     ';
      aFDQuery.ParamByName('NM_CATEGORIA').AsString := aListCategoria[aIndex];
      try
        aFDQuery.ExecSQL;
        AConnection.CommitRetaining;
      except
        on e : exception do begin
          AConnection.RollbackRetaining;
          raise Exception.Create(e.Message);
        end;
      end;
    end;
  finally
    FreeAndNil(aListCategoria);
    FreeAndNil(aFDQuery);
  end;
end;

procedure TFactory.SetChecked(aNode: TTreeNode; aChecked: Boolean);
var
  TvItem:TTVItem;
begin
  TvItem.Mask := TVIF_STATE;
  TvItem.hItem := aNode.ItemId;
  TvItem.StateMask := TVIS_STATEIMAGEMASK;
  if aChecked then
    TvItem.State := INDEXTOSTATEIMAGEMASK(2)  // Definir como marcado
  else
    TvItem.State := INDEXTOSTATEIMAGEMASK(1); // Definir como desmarcado
  TreeView_SetItem(aNode.TreeView.Handle, TvItem);
end;

procedure TFactory.SetLoginAdm(aConnection: TFDConnection);
var
  aFDQuery    : TFDQuery;
  aStrBuilder : TStringBuilder;
begin
  aFDQuery            := TFDQuery.Create(nil);
  aFDQuery.Connection := AConnection;
  aStrBuilder         := TStringBuilder.Create;
  try

    aStrBuilder.Clear;
    aStrBuilder.Append('INSERT INTO UC_PERFIL (CO_PERFIL, NM_PERFIL) ').
                Append('VALUES (GEN_ID(INC_CO_PERFIL, 1), :NM_PERFIL)');
    aFDQuery.SQL.Text := aStrBuilder.ToString;
    aFDQuery.Params[0].AsString := 'Administrador';
    aFDQuery.ExecSQL;
    aFDQuery.Connection.CommitRetaining;

   aStrBuilder.Clear;
   aStrBuilder.Append('UPDATE UC_PERFIL_ACAO           ').
               Append('   SET IN_ATIVA = :IN_ATIVA     ').
               Append('   WHERE CO_PERFIL = :CO_PERFIL;');
   aFDQuery.SQL.Text := aStrBuilder.ToString;
   aFDQuery.Params[0].AsBoolean := True;
   aFDQuery.Params[1].AsInteger := 1;
   aFDQuery.ExecSQL;
   aFDQuery.Connection.CommitRetaining;

   aStrBuilder.Clear;
   aStrBuilder.Append('INSERT INTO UC_USUARIO (CO_USUARIO, CO_PERFIL, NM_USUARIO, NM_LOGIN, TX_SENHA, IN_LIBERADO)                      ').
               Append('                VALUES (GEN_ID(INC_CO_USUARIO, 1), :CO_PERFIL, :NM_USUARIO, :NM_LOGIN, :TX_SENHA, :IN_LIBERADO); ');
   aFDQuery.SQL.Text := aStrBuilder.ToString;
   aFDQuery.Params[0].AsInteger := 1;
   aFDQuery.Params[1].AsString  := 'Administrador';
   aFDQuery.Params[2].AsString  := 'Admin';
   aFDQuery.Params[3].AsString  := GetStrHashSHA512_256('Su65065584');
   aFDQuery.Params[4].AsBoolean := True;
   aFDQuery.ExecSQL;
   aFDQuery.Connection.CommitRetaining;
  finally
    FreeAndNil(aFDQuery);
    FreeAndNil(aStrBuilder);
  end;

end;

function TFactory.StrongPassword(aValue: String): Boolean;
var
  wExpressao : String;
begin
  wExpressao := '(?=^.{8,}$)((?=.*\d)(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$';
  Result := TRegex.IsMatch(aValue, wExpressao);
end;

function TFactory.SugerirNomeUser(aValue : String) : String;
var
  StrList : TStringList;
begin
  StrList := TStringList.Create;
  try
    StrList.Delimiter     := ' ';
    StrList.DelimitedText := LowerCase(aValue.Trim);
    Result := Copy(StrList[0], 1, 1) + StrList[StrList.Count-1];
    Result := RemoverCaracteresEspeciais(Result);
  finally
    FreeAndNil(StrList);
  end;
end;

procedure TFactory.UnMarkAllNodes(aNode: TTreeNode);
var
  ChildNode: TTreeNode;
begin
  // Desmarcar o nó atual
  aNode.StateIndex := 1;

  // Percorrer todos os nós filhos
  ChildNode := aNode.GetFirstChild;
  while Assigned(ChildNode) do
  begin
    UnmarkAllNodes(ChildNode);
    ChildNode := ChildNode.GetNextSibling;
  end;
end;

procedure TFactory.UnMarkAllTreeViewNodes(aTreeView: TTreeView);
var
  Node: TTreeNode;
begin
  // Percorrer todos os nós do TreeView
  Node := aTreeView.Items.GetFirstNode;
  while Assigned(Node) do
  begin
    UnmarkAllNodes(Node);
    Node := Node.GetNextSibling;
  end;
end;

{ TAgenda }

procedure TAgenda.Setdata(const Value: TDate);
begin
  Fdata := Value;
end;

procedure TAgenda.Sethorario(const Value: TTime);
begin
  Fhorario := Value;
end;

{ THoratios }

procedure THoratios.Setdia(const Value: Integer);
begin
  Fdia := Value;
end;

procedure THoratios.Setentrada1(const Value: TTime);
begin
  Fentrada1 := Value;
end;

procedure THoratios.Setentrada2(const Value: TTime);
begin
  Fentrada2 := Value;
end;

procedure THoratios.Setsaida1(const Value: TTime);
begin
  Fsaida1 := Value;
end;

procedure THoratios.Setsaida2(const Value: TTime);
begin
  Fsaida2 := Value;
end;

end.
