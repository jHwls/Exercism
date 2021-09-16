defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @d6 1..6

  @spec modifier(pos_integer()) :: integer()
  def modifier(score), do: Integer.floor_div(score - 10, 2)

  @spec ability :: pos_integer()
  def ability do
    Enum.map(1..4, fn _ -> Enum.random(@d6) end)
    |> Enum.sort()
    |> tl()
    |> Enum.reduce(&(&1 + &2))
  end

  @spec character :: t()
  def character do
    stats =
      ~w[strength dexterity constitution intelligence wisdom charisma]a
      |> Map.new(&{&1, ability()})

    struct(__MODULE__, Map.put(stats, :hitpoints, 10 + modifier(stats.constitution)))
  end
end
