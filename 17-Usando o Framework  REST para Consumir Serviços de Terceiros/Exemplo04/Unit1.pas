unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Panel2: TPanel;
    FDMemTable1id: TWideStringField;
    FDMemTable1name: TWideStringField;
    FDMemTable1year: TWideStringField;
    FDMemTable1color: TWideStringField;
    FDMemTable1pantone_value: TWideStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Button1: TButton;
    procedure ConsultarDados(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.ConsultarDados(Sender: TObject);
begin
  RESTRequest1.Params.ParameterByName('page').Value := SpinEdit1.Text;
  RESTRequest1.Execute;
end;

end.
