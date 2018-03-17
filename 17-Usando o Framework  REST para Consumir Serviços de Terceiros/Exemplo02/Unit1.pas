unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Mask;

type
  TForm1 = class(TForm)
    Button1: TButton;
    MaskEdit1: TMaskEdit;
    Memo1: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses System.Json, REST.Json;

procedure TForm1.Button1Click(Sender: TObject);
var
  cepJSON: TJSONValue;
begin
  RESTRequest1.Params.ParameterByName('cep').Value := MaskEdit1.Text;
  RESTRequest1.Execute;
  cepJSON := TJSONObject.ParseJSONValue(RESTResponse1.Content.Trim);
  try
    Memo1.Text := TJson.Format(cepJSON);
  finally
    cepJSON.Free;
  end;
end;

end.
