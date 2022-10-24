filename = IO.gets("Archivo para contar palabras de: ") |> String.trim
body = File.read!(filename)
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
body |> Enum.count() |> IO.puts()
