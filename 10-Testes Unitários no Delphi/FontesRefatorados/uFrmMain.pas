unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtKmInicial: TEdit;
    edtKmFinal: TEdit;
    edtMediaConsumo: TEdit;
    edtValorLitro: TEdit;
    btnCalcularConsumo: TButton;
    edtValorFinal: TEdit;
    procedure btnCalcularConsumoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.btnCalcularConsumoClick(Sender: TObject);
var
  LKMInicial,
  LKMFinal,
  LMediaConsumo,
  LValorLitro,
  LResultado: double;
begin
  LKMInicial := StrToFloat(edtKmInicial.Text);
  LKMFinal := StrToFloat(edtKmFinal.Text);
  LMediaConsumo := StrToFloat(edtMediaConsumo.Text);
  LValorLitro := StrToFloat(edtValorLitro.Text);
  LResultado := (LKMFinal - LKMInicial) / LMediaConsumo * LValorLitro;
  edtValorFinal.Text := LResultado.ToString();
end;

end.
