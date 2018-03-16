program ConsumoVeiculoTests;

uses
  TestFrmMain in 'TestFrmMain.pas',
  DUnitTestRunner,
  uFrmMain in '..\..\uFrmMain.pas' {FrmPrincipal};

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

