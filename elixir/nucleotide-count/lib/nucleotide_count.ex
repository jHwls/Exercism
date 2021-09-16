defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand
    |> Enum.count(&(&1 === nucleotide))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    @nucleotides
    |> Enum.into(%{}, &{&1, count(strand, &1)})
  end

  @doc """
  Single step version using Enum's frequencies/1.
  Would need to raise if not included in @nucleotides,
  or filter out.

  ## Examples

  iex> NucleotideCount.frequencies('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec frequencies(charlist()) :: map()
  def frequencies(strand) do
    strand
    |> Enum.frequencies()
  end
end
