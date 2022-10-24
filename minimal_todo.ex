defmodule MinimalTodo do
  def start do
    filename = IO.gets("Nombre del archivo a cargar: ") |> String.trim
    read(filename)
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
    lines = String.split(body, ~r{(\r\n|\r|\n)})
  end
end
