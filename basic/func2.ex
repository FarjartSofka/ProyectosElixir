defmodule Impuestos do
  def impuesto(precio, tipo) do
    (1+ porcentaje(tipo)) * precio
  end
  def porcentaje(tipo) do
    cond do
      tipo == :normal -> 0.21
      tipo == :reducido -> 0.1
      tipo == :super_reducido -> 0.04
    end
  end
end

IO.inspect Impuestos.impuesto(10, :normal)
