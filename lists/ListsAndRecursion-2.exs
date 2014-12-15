defmodule MyList do
  def max([x]), do: x
  def max([head | tail]), do: Kernel.max(head, max(tail))
end

