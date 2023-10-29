unit uDMConexao;

interface

uses
  System.SysUtils,
  System.Classes,
  System.INIFiles,
  Vcl.Dialogs,
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
  FireDAC.Comp.Client,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.FB,
  Data.DB,
  Factory, frxClass, frxFDComponents;

type
  TDMConexao = class(TDataModule)
    FDConexao: TFDConnection;
    FDFBDriverLink: TFDPhysFBDriverLink;
    frxFDComponents1: TfrxFDComponents;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    aFactory : TFactory;
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;
  wServidor, wBase, wPorta, wUsuario, wSenha : String;
  wMaxTentativasLogin : Integer;
  wIniFile : TIniFile;
  wLoginLogout : Boolean;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConexao.DataModuleCreate(Sender: TObject);
begin
  try
    FDFBDriverLink.VendorLib := ExtractFilePath(ParamStr(0))+'fbClient.dll';
  except
    on e : exception do
    begin
      raise Exception.Create('Faltando fbClient.dll na pasta da aplicação')
    end;
  end;
  wMaxTentativasLogin := 0;
  aFactory := TFactory.Create;
  try
    FDConexao.Params.Clear;
    FDConexao.Params.Values['DriverID']  := 'FB';
    FDConexao.Params.Values['Server']    := aFactory.Cripto('D', wServidor, '512');
    FDConexao.Params.Values['Protocol']  := 'TCPIP';
    FDConexao.Params.Values['Port']      := aFactory.Cripto('D', wPorta,    '512');
    FDConexao.Params.Values['RoleName']  := 'RDB$ADMIN';
    FDConexao.Params.Values['Database']  := aFactory.Cripto('D', wBase,     '512');
    FDConexao.Params.Values['User_name'] := aFactory.Cripto('D', wUsuario,  '512');
    FDConexao.Params.Values['Password']  := aFactory.Cripto('D', wSenha,    '512');
    try
      FDConexao.Connected                := True;
    except
      on e : Exception do begin
        raise Exception.Create('Classe: ' + e.ClassName + ' erro: ' + e.Message);
      end;
    end;
  finally
    FreeAndNil(aFactory);
  end;
end;

end.
