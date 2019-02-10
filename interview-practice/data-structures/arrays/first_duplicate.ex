def firstDuplicate(coll), do: firstDuplicate(coll, MapSet.new())

def firstDuplicate([], _), do: -1

def firstDuplicate([head | tail], set) do
  if MapSet.member?(set, head) do
    head
  else
    firstDuplicate(tail, MapSet.put(set, head))
  end
end
