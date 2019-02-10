def transpose(matrix) do
  matrix
  |> List.zip()
  |> Enum.map(&Tuple.to_list/1)
end

def rotate_image(matrix) do
  matrix
  |> Enum.reverse()
  |> transpose()
end
