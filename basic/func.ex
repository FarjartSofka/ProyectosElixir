defmodule Calculadora do

  def suma(a,b) do
    a+b
  end
  def resta(a,b) do
    a-b
  end
  def multiplicacion(a,b) do
    a*b
  end
  def division(a,b) when b == 0 do
    :inf
  end
  def division(a,b) do
    a/b
  end

end
