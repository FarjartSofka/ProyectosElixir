defmodule Calculon do
  def operar(func) do
    func.(5, 3)
  end
end

IO.puts Calculon.operar(fn a,b -> a + b end)

operacion = fn a, b -> (a * b) + (b - a) end
IO.puts Calculon.operar(operacion)
