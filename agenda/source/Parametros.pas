unit Parametros;

interface

uses
  System.Classes;

type
  TParametro = class
  private
    class var Fnm_fantasia: String;
    class var Fnm_empresa: String;
    class var Fco_empresa: Integer;
    class var Fnm_usuario: String;
    class var Fco_usuario: Integer;
    class var Fnm_login: String;
    class var Ftx_senha: String;
    class procedure Setco_empresa(const Value: Integer); static;
    class procedure Setco_usuario(const Value: Integer); static;
    class procedure Setnm_empresa(const Value: String); static;
    class procedure Setnm_fantasia(const Value: String); static;
    class procedure Setnm_usuario(const Value: string); static;
    class procedure Setnm_login(const Value: String); static;
    class procedure Settx_senha(const Value: String); static;
  public
    class property co_empresa : Integer read Fco_empresa write Setco_empresa;
    class property co_usuario : Integer read Fco_usuario write Setco_usuario;
    class property nm_empresa : String read Fnm_empresa write Setnm_empresa;
    class property nm_fantasia : String read Fnm_fantasia write Setnm_fantasia;
    class property nm_usuario : String read Fnm_usuario write Setnm_usuario;
    class property nm_login : String read Fnm_login write Setnm_login;
    class property tx_senha : String read Ftx_senha write Settx_senha;
  end;

implementation


{ TParametro }

class procedure TParametro.Setco_empresa(const Value: Integer);
begin
  Fco_empresa := Value;
end;

class procedure TParametro.Setco_usuario(const Value: Integer);
begin
  Fco_usuario := Value;
end;

class procedure TParametro.Setnm_empresa(const Value: String);
begin
  Fnm_empresa := Value;
end;

class procedure TParametro.Setnm_fantasia(const Value: String);
begin
  Fnm_fantasia := Value;
end;

class procedure TParametro.Setnm_login(const Value: String);
begin
  Fnm_login := Value;
end;

class procedure TParametro.Setnm_usuario(const Value: string);
begin
  Fnm_usuario := Value;
end;

class procedure TParametro.Settx_senha(const Value: String);
begin
  Ftx_senha := Value;
end;

end.
