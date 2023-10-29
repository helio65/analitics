unit DadosCep;

interface

uses
  System.Classes;

type
  TDadosCep = class
  private
    Flogradouro: String;
    Fibge: String;
    Fbairro: String;
    Fddd: String;
    Fuf: String;
    Fcep: String;
    Fsiafi: String;
    Flocalidade: String;
    Fcomplemento: String;
    Fgia: String;
    procedure Setbairro(const Value: String);
    procedure Setcep(const Value: String);
    procedure Setcomplemento(const Value: String);
    procedure Setddd(const Value: String);
    procedure Setgia(const Value: String);
    procedure Setibge(const Value: String);
    procedure Setlocalidade(const Value: String);
    procedure Setlogradouro(const Value: String);
    procedure Setsiafi(const Value: String);
    procedure Setuf(const Value: String);
  public
    property cep : String read Fcep write Setcep;
    property logradouro : String read Flogradouro write Setlogradouro;
    property complemento : String read Fcomplemento write Setcomplemento;
    property bairro : String read Fbairro write Setbairro;
    property localidade : String read Flocalidade write Setlocalidade;
    property uf : String read Fuf write Setuf;
    property ibge : String read Fibge write Setibge;
    property gia : String read Fgia write Setgia;
    property ddd : String read Fddd write Setddd;
    property siafi : String read Fsiafi write Setsiafi;
  end;

implementation

{ TDadosCep }

procedure TDadosCep.Setbairro(const Value: String);
begin
  Fbairro := Value;
end;

procedure TDadosCep.Setcep(const Value: String);
begin
  Fcep := Value;
end;

procedure TDadosCep.Setcomplemento(const Value: String);
begin
  Fcomplemento := Value;
end;

procedure TDadosCep.Setddd(const Value: String);
begin
  Fddd := Value;
end;

procedure TDadosCep.Setgia(const Value: String);
begin
  Fgia := Value;
end;

procedure TDadosCep.Setibge(const Value: String);
begin
  Fibge := Value;
end;

procedure TDadosCep.Setlocalidade(const Value: String);
begin
  Flocalidade := Value;
end;

procedure TDadosCep.Setlogradouro(const Value: String);
begin
  Flogradouro := Value;
end;

procedure TDadosCep.Setsiafi(const Value: String);
begin
  Fsiafi := Value;
end;

procedure TDadosCep.Setuf(const Value: String);
begin
  Fuf := Value;
end;

end.
