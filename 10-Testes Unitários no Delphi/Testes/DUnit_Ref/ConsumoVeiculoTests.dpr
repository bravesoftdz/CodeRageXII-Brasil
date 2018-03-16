program ConsumoVeiculoTests;

uses
  DUnitTestRunner,
  TestCalculoConsumo in 'TestCalculoConsumo.pas',
  uCalculoConsumo in '..\..\uCalculoConsumo.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

