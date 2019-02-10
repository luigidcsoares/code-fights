defmodule Parallel do
  def map(coll, f) do
    coll
    |> Enum.map(&Task.async(fn -> f.(&1) end))
    |> Enum.map(&Task.await/1)
  end
end

def is_crypt_solution(crypt, solution) do
  map = Map.new(solution, fn [k, v] -> {k, v} end)

  decoded =
    Parallel.map(
      crypt,
      fn str ->
        str
        |> String.graphemes()
        |> Parallel.map(&Map.get(map, &1))
      end
    )

  leading =
    Enum.any?(
      decoded,
      fn
        [_ | []] -> false
        [head | _] -> head == "0"
      end
    )

  valid =
    decoded
    |> Parallel.map(&(&1 |> Enum.join() |> String.to_integer()))
    |> (fn [x, y, z] -> x + y == z end).()

  not leading and valid
end
