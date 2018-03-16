unit uCalculoConsumo;

interface

type
  TConsumo = class
    function Calcular(AKMInicial, AKMFinal, AMediaConsumo,
      AValorLitro: double): double;
  end;

implementation

function TConsumo.Calcular(AKMInicial, AKMFinal, AMediaConsumo,
  AValorLitro: double): double;
begin
  result := (AKMFinal - AKMInicial) / AMediaConsumo * AValorLitro;
end;

end.
