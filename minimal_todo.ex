defmodule MinimalTodo do
  def start do
    filename = IO.gets("Nombre del archivo a cargar: ") |> String.trim
    read(filename)
      |> parse
      |> get_command
  end

  def show_todos(data, next_command? \\ true) do
    items = Map.keys data
    IO.puts "Tienes los siguientes items por hacer: \n"
    Enum.each items, fn item -> IO.puts item end
    IO.puts "\n"
    if next_command? do
      get_command(data)
    end
  end

  def get_command(data) do
    prompt = """
    Escribe la letra del comando que quieres usar \n
    (L)eer To-dos (A)ñadir nuevo (B)orrar (C)argar archivo (G)rabar archivo (X) Salir
    """
    command = IO.gets(prompt)
      |> String.trim
      |> String.downcase

    case command doa
      "l" ->   show_todos(data)
      #"a" ->
      "b" ->   delete_todo(data)
      #"c" ->
      #"g" ->
      "x" -> "Adios!!"
      _ -> get_command(data)
    end
  end

  def delete_todo(data) do
    todo = IO.gets("Cual tarea deseas borrar?\n") |> String.trim
    if Map.has_key? data, todo do
      IO.puts "Se borrara la tareas #{todo}"
      new_map = Map.drop(data, [todo])
      IO.puts ~s("#{todo} sera eliminado")
      get_command(new_map)
    else
      IO.puts ~s(No existe la tarea "#{todo}")
      show_todos(data, false)
      delete_todo(data)
    end
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, body}       ->  body
      {:error, reason}  ->  IO.puts ~s(No se pudo abrir el archivo "#{filename}\n")
                            IO.puts ~s("#{:file.format_error reason}"\n)
                            start()
    end
  end

  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    IO.puts([header | lines])
    titles = tl String.split(header, ";")
    parse_lines(lines, titles)
  end

  def parse_lines(lines, titles) do
    Enum.reduce(lines, %{}, fn line, built ->
      [name | fields] = String.split(line, ";")
      if Enum.count(fields) == Enum.count(titles) do
        line_data = Enum.zip(titles, fields) |> Enum.into(%{})
        Map.merge(built, %{name => line_data})
      else
        built
      end
    end)
  end
end
