unit TestCalculoConsumo;

interface

uses
  TestFramework, uCalculoConsumo;

type
  // Test methods for class TConsumo
  TestTConsumo = class(TTestCase)
  strict private
    FConsumo: TConsumo;
  public
    procedure SetUp(); override;
    procedure TearDown(); override;
  published
    procedure TestCalcularConsumo();
  end;

implementation

procedure TestTConsumo.SetUp();
begin
  FConsumo := TConsumo.Create();
end;

procedure TestTConsumo.TearDown();
begin
  FConsumo.Free();
  FConsumo := nil;
end;

procedure TestTConsumo.TestCalcularConsumo();
var
  AKMInicial: Double;
  AKMFinal: Double;
  AValorLitro: Double;
  AMediaConsumo: Double;
  LValorRetorno: Double;
  LValorEsperado: Double;
begin
  AKMInicial := 10000;
  AKMFinal := 11000;
  AValorLitro := 4;
  AMediaConsumo := 10;
  LValorRetorno := FConsumo.Calcular(
      AKMInicial, AKMFinal, AMediaConsumo, AValorLitro);
  LValorEsperado := 400;
  Assert(LValorRetorno = LValorEsperado);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTConsumo.Suite);
end.

