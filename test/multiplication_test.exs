defmodule MultiplicationTest do
  use ExUnit.Case
  import Multiplication

  test "Passed a single element returns a single multiplication" do
	assert [4] == Multiplication.cross_multiplication([2])
  end
 
end
