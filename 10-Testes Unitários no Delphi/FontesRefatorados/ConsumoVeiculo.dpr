program ConsumoVeiculo;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmPrincipal},
  uCalculoConsumo in 'uCalculoConsumo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
