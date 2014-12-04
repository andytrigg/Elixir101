defmodule Chop do
  def guess(actual, a..b) do
    next_guess = div(a+b,2)
    IO.puts "Is it #{next_guess}"
    _guess(next_guess, actual, a..b)    
  end

  def _guess(guess, actual, _) when guess == actual do
    IO.puts "#{actual}"
  end

  def _guess(guess, actual, a..b) when guess < actual do
    guess(actual, guess..b)
  end

  def _guess(guess, actual, a..b) when guess > actual do
    guess(actual, a..guess) 
  end
end
