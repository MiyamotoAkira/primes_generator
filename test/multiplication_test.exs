defmodule MultiplicationTest do
  use ExUnit.Case
  import Multiplication

  test "Passed a single element returns a single multiplication" do
	assert [[4]] == Multiplication.cross_multiplication([2])
  end

  test "Passed two  elements returns two sets of multiplications" do
	assert [[4, 6], [6, 9]] == Multiplication.cross_multiplication([2,3])
  end

end
