edad = IO.gets("Cual es tu edad?")
edad_entera = String.to_integer(String.trim(edad))
mensaje = if edad_entera >= 18, do: "Mayor de edad", else: espera = 18 - edad_entera "Menor de edad, vuelve en #{espera} años"
IO.puts(mensaje)
