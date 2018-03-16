program ConsumoVeiculo;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
