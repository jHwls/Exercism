defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&transcribe(&1))
  end

  defp transcribe(65), do: 85
  defp transcribe(67), do: 71
  defp transcribe(84), do: 65
  defp transcribe(71), do: 67
end
