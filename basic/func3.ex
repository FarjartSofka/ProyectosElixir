defmodule Funcion3 do

  def print2({:ok, x}) do
    IO.puts("Todo fue bien: #{x}")
  end
  def print2({:error, _x}) do
    IO.puts("Hubieron problemas")
  end

end
