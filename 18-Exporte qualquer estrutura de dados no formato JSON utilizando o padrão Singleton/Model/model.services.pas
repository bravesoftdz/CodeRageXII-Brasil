unit model.services;

interface

uses
  Data.DB, System.JSON, REST.JSON;

type
  TMyService = class
  strict protected
    class var FMyService: TMyService;
  private
    constructor CreatePrivate;
  public
    constructor Create;
    class function GetInstance: TMyService;
    function DataSetToJsonArray(DataSet: TDataSet): TJSONArray;
  end;

implementation

uses
  System.SysUtils;

{ TMyService }

constructor TMyService.Create;
begin
  raise Exception.Create('Não é possível criar um objeto de serviço. Utilize TMyService.GetInstance!');
end;

constructor TMyService.CreatePrivate;
begin
 inherited Create;
end;

function TMyService.DataSetToJsonArray(DataSet: TDataSet): TJSONArray;
var
  jObj: TJSONObject;
  I: Integer;
begin
  if not DataSet.Active then DataSet.Open;
  DataSet.First;
  Result := TJSONArray.Create;

  while not DataSet.Eof do
  begin
    jObj := TJSONObject.Create;
    for I := 0 to Pred(DataSet.FieldCount) do
    begin
      jObj.AddPair(DataSet.Fields[I].FieldName,DataSet.Fields[I].AsString);
    end;
    Result.AddElement(jObj);
    DataSet.Next;
  end;
end;

class function TMyService.GetInstance: TMyService;
begin
 if not Assigned(FMyService) then
    FMyService := TMyService.CreatePrivate;

  Result := FMyService;
end;

end.
