expresion = {:ok, "hola"}
output = case expresion do
  {:ok, x} -> "Se resolvio correctamente #{x}"
  {:error, y} -> "Problemas #{y}"
end

IO.puts output
