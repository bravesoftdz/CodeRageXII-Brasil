unit model.connection;

interface

uses
  FireDAC.Comp.Client;

type
  TDBConnection = class
  strict protected
    class var FDBConnection: TDBConnection;
  private
    FConnection: TFDConnection;
    FCommand: TFDQuery;
    constructor CreatePrivate;
  public
    constructor Create;
    class function GetInstance: TDBConnection;
    function ExecuteSelect(Sql: String): TFDQuery;
    function ExecuteCommand(Sql: String): Boolean;
  end;

implementation

uses
  System.SysUtils;

{ TDBConnection }

constructor TDBConnection.Create;
begin
   raise Exception.Create('Não é possível criar um objeto de conexão. Utilize TDBConnection.GetInstance!');
end;

constructor TDBConnection.CreatePrivate;
begin
  inherited Create;
  FConnection := TFDConnection.Create(nil);
  FCommand := TFDQuery.Create(nil);
  FCommand.Connection := FConnection;


  {Configurar objeto de conexão}
  FConnection.DriverName := 'MySQL';
  FConnection.Params.Values['Database'] := 'rmfactory';
  FConnection.Params.Values['User_Name'] := 'rmfactory';
  FConnection.Params.Values['Password'] := '123456';
  FConnection.Params.Values['Server'] := 'mysql.rmfactory.com.br';
  FConnection.Params.Values['DriverID'] := 'MySQL';

  FConnection.Open;

end;

function TDBConnection.ExecuteCommand(Sql: String): Boolean;
begin
  try
    FCommand.SQL.Clear;
    FCommand.SQL.Add(Sql);
    FCommand.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TDBConnection.ExecuteSelect(Sql: String): TFDQuery;
begin
  FCommand.SQL.Clear;
  FCommand.Open(Sql);
  Result := FCommand;
end;

class function TDBConnection.GetInstance: TDBConnection;
begin
  if not Assigned(FDBConnection) then
    FDBConnection := TDBConnection.CreatePrivate;

  Result := FDBConnection;
end;

end.
