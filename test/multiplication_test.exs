defmodule MultiplicationTest do
  use ExUnit.Case
  use ExUnit.Parameterized
  import Multiplication

  test "Passed a single element returns a single multiplication" do
    assert [[4]] == Multiplication.cross_multiplication([2])
  end

  test "Passed two  elements returns two sets of multiplications" do
    assert [[4, 6], [6, 9]] == Multiplication.cross_multiplication([2,3])
  end

  test_with_params "Passed an array of numbers, there are count*count numbers back",
  fn(array) ->
    expected = Enum.count(array) * Enum.count(array)
    result = Multiplication.cross_multiplication(array)
    count = Enum.reduce(result, 0, fn(x, acc) -> Enum.count(x) + acc end)
    assert expected == count
  end do
    [
      {[2]},
      {[2, 3]},
      {[2, 3, 5]},
      {[2, 3, 5, 7, 11]}
    ]
  end
end
