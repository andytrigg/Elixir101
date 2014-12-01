defmodule Times do
  def double(n), do: n * 2

  def tripple(n), do: n * 3

  def quadruple(n), do: double(double(n))
end

