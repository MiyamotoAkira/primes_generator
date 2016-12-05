defmodule Multiplication do
  def cross_multiplication(numbers) do
	Enum.map(numbers, fn(x) -> Enum.map(numbers, fn(y) -> x * y end) end)
  end
end
