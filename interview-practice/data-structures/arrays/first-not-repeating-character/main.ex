def frequencies(coll) do
  Enum.reduce(
    coll,
    %{},
    fn x, acc ->
      Map.update(acc, x, 1, &(&1 + 1))
    end
  )
end

def first_not_repeating_character(s) do
  graphemes = String.graphemes(s)
  freq = frequencies(graphemes)

  graphemes
  |> Enum.drop_while(fn x -> freq[x] > 1 end)
  |> case do
    [] -> "_"
    [head | _] -> head
  end
end
