defmodule Matrix do
  def transpose(matrix) do
    matrix
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def split_blocks(matrix, n) do
    matrix
    |> Enum.map(&Enum.chunk_every(&1, n))
    |> Enum.chunk_every(n)
    |> Enum.map(&transpose/1)
    |> Enum.concat()
  end
end

def uniques?(coll), do: uniques?(coll, MapSet.new())
defp uniques?([], _), do: true

defp uniques?([head | tail], set) do
  if MapSet.member?(set, head) do
    false
  else
    uniques?(tail, MapSet.put(set, head))
  end
end

defp valid?(coll) do
  coll
  |> Enum.filter(&(&1 != "."))
  |> IO.inspect()
  |> uniques?()
end

def sudoku2(grid) do
  valid_rows =
    grid
    |> Enum.map(&valid?/1)
    |> Enum.all?(& &1)

  valid_cols =
    grid
    |> Matrix.transpose()
    |> Enum.map(&valid?/1)
    |> Enum.all?(& &1)

  valid_blocks =
    grid
    |> Matrix.split_blocks(3)
    |> Enum.map(&Enum.concat/1)
    |> Enum.map(&valid?/1)
    |> Enum.all?(& &1)

  valid_rows and valid_cols and valid_blocks
end
