unit Persistence;

interface

uses
  System.Classes,
  System.SysUtils,
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
  FireDAC.Comp.Client;

type
  TPersistence = class
  private
  public
    procedure Incluir(aValue : TFDQuery);
    procedure Editar(aValue : TFDQuery);
    procedure Excluir(aValue : TFDQuery);
    procedure Cancelar(aValue : TFDQuery);
    procedure Gravar(aValue : TFDQuery);
  end;

implementation

{ TPersistence }

procedure TPersistence.Cancelar(aValue: TFDQuery);
begin
  aValue.CancelUpdates;
  aValue.Connection.Commit;
end;

procedure TPersistence.Editar(aValue: TFDQuery);
begin
  if not aValue.Connection.InTransaction then
    aValue.Connection.StartTransaction;
  aValue.Edit;
end;

procedure TPersistence.Excluir(aValue: TFDQuery);
begin
  if not aValue.Connection.InTransaction then
    aValue.Connection.StartTransaction;
  try
    aValue.Delete;
    aValue.ApplyUpdates(0);
    aValue.Connection.Commit;
  except
    on e : exception do
    begin
      aValue.Connection.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TPersistence.Gravar(aValue: TFDQuery);
begin
  if not aValue.Connection.InTransaction then
    aValue.Connection.StartTransaction;
  try
    aValue.Post;
    aValue.ApplyUpdates(0);
    aValue.Connection.Commit;
  except
    on e : exception do
    begin
      aValue.Connection.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TPersistence.Incluir(aValue: TFDQuery);
begin
  if not aValue.Connection.InTransaction then
    aValue.Connection.StartTransaction;
  if not aValue.Active then
    aValue.Open;
  aValue.Insert;
end;

end.
