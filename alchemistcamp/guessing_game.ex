defmodule GuessingGame do
  def mid(low, high) do
    div(low + high, 2)
  end

  def guess(a, b) when a > b, do: guess(b, a)

  def guess(low, high) do
    answer = String.trim(IO.gets("Tal vez estas pensando en #{mid(low, high)}?\n"))

    case answer do
      "mayor" ->
        bigger(low, high)

      "menor" ->
        smaller(low, high)

      "si" ->
        "Excelente, sabia que era ese numero"

      _ ->
        IO.puts(~s{ Escribe "mayor", "menor" o "si" })
        guess(low, high)
    end
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
