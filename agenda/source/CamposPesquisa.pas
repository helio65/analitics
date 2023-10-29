unit CamposPesquisa;

interface

uses
  System.Classes;

type
  TCamposPesquisa = class
  private
    FDescricao: String;
    FCampo: String;
    procedure SetCampo(const Value: String);
    procedure SetDescricao(const Value: String);
  public
    property Campo : String read FCampo write SetCampo;
    property Descricao : String read FDescricao write SetDescricao;
  end;

implementation

{ TCamposPesquisa }

procedure TCamposPesquisa.SetCampo(const Value: String);
begin
  FCampo := Value;
end;

procedure TCamposPesquisa.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

end.
