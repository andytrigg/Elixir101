defmodule MyList do
  def sum1([]), do: 0
  def sum1([ head | tail ]), do: head + sum1(tail)
end

