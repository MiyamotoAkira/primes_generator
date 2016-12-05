defmodule Multiplication do
  def cross_multiplication(numbers) do
	numbers
	|> Stream.map(&Task.async(fn -> Enum.map(numbers, fn(y) -> &1 * y end)end))
	|> Enum.map(&Task.await(&1))  
  end
end
