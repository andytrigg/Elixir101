# The simplest version is probably to use list concatenation. However,
# this version ends up rebuilding the list at each step
defmodule UsingConcat do
  def flatten([]), do: []
  def flatten([ head | tail ]), do: flatten(head) ++ flatten(tail)
  def flatten(head), do: [ head ]
end

# This version is more efficient, as it picks successive head values
# from a list, adding them to `result`. It is also tail recursive.
# The trick is that we have to unnest the head if the head itself is a
# list.

defmodule MyList do

    def flatten(list), do: _flatten(list, [])

    defp _flatten([], result), do: Enum.reverse(result)

    # The following two function heads deal with the head
    # being a list
    defp _flatten([ [ h | [] ] | tail], result) do
      _flatten([ h | tail], result)
    end

    defp _flatten([ [ h | t ] | tail], result) do
      _flatten([ h, t | tail], result)
    end

    # Otherwise the head is not, and we can collect it
    defp _flatten([ head | tail ], result) do
      _flatten(tail, [ head | result ])
    end
end

IO.inspect MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])

# José Valim came up with a different implementation. It is interesting
# to spend some time with this, because it breaks down the problem
# a little differently. Rather that extract individual elements
# to built the result list, it treats the original list more like
# a tree, flattening subtrees on the right and merging the results
# into a tree that itself gets flattened. It is tider, and I prefer 
# it to my solution. 

defmodule JVList do
  def flatten(list), do: do_flatten(list, [])

  def do_flatten([h|t], tail) when is_list(h) do
    do_flatten(h, do_flatten(t, tail))
  end

  def do_flatten([h|t], tail) do
    [h|do_flatten(t, tail)]
  end

  def do_flatten([], tail) do
    tail
  end
end
