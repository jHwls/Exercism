defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @lowercase_latin ?a..?z
  @uppercase_latin ?A..?Z

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(&caesar_shift(&1, shift))
    |> to_string()
  end

  defp fetch_alphabet(char) do
    cond do
      char in @lowercase_latin -> {:ok, @lowercase_latin}
      char in @uppercase_latin -> {:ok, @uppercase_latin}
      true -> :error
    end
  end

  defp caesar_shift(char, shift) do
    with {:ok, base.._max = alpha} <- fetch_alphabet(char) do
      base + Integer.mod(char + shift - base, Enum.count(alpha))
    else
      _ -> char
    end
  end
end
