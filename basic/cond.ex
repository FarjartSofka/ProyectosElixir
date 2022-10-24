lluvia = String.to_integer(String.trim(IO.gets("Cuanta lluvia ha caido?")))

mensaje = cond do
  lluvia == 0 -> "No ha llovido"
  lluvia < 30 -> "Ha llovido un poco"
  lluvia < 60 -> "Ha llovido un rato"
  lluvia < 90 -> "Ha llovido bastante"
  true -> "Demasiada lluvia"
end

IO.puts(mensaje)
