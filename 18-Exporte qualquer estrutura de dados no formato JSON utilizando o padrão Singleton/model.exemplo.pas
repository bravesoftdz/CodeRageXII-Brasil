unit model.exemplo;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  System.JSON;

type
{$METHODINFO ON}
  TSMExemplo = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function TesteLancamento: TJSONArray;
    function Contatos: TJSONArray;
    function Clientes: TJSONArray;
  end;
{$METHODINFO OFF}

implementation

uses System.StrUtils, model.connection, model.services;

function TSMExemplo.Clientes: TJSONArray;
begin
  Result := TMyService.GetInstance.DataSetToJsonArray
    (TDBConnection.GetInstance.ExecuteSelect('Select * from cliente_mss'));
end;

function TSMExemplo.Contatos: TJSONArray;
begin
  Result := TMyService.GetInstance.DataSetToJsonArray
    (TDBConnection.GetInstance.ExecuteSelect('Select * from CONTATO'));
end;

function TSMExemplo.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSMExemplo.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TSMExemplo.TesteLancamento: TJSONArray;
begin

  Result := TMyService.GetInstance.DataSetToJsonArray
    (TDBConnection.GetInstance.ExecuteSelect('Select * from lancamento'));
end;

end.
