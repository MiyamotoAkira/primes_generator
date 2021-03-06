defmodule PrimesGenerator.Sieves.TrialDivisionImpTest do
  use ExUnit.Case
  use ExUnit.Parameterized
  alias PrimesGenerator.Sieves.TrialDivisionImp, as: Trial

  test "When asking for single prime it will return just 2" do
    assert [2] == Trial.generate_prime(1)
  end

  test "When asking for two primes it will return 2 and 3" do
    assert [2, 3] == Trial.generate_prime(2)
  end

  test_with_params "When asking for a number of primes, that amount should be returned",
  fn(number_of_primes) ->
    assert Enum.count(Trial.generate_prime(number_of_primes)) == number_of_primes
  end do
    [
      {1},
      {4},
      {8},
      {16}
    ]
  end

  test_with_params "When asking for a number of primes, only the first one should be divisible by 2",
  fn(number_of_primes) ->
    assert (Trial.generate_prime(number_of_primes)
      |> Enum.drop(1)
      |> Enum.all?(fn(x) -> rem(x,2) == 1 end))
  end do
    [
      {1},
      {4},
      {8},
      {16}
    ]
  end

  test_with_params "When asking for a number of primes, no number in result is a common denominator of another",
  fn(number_of_primes) ->
    result = Trial.generate_prime(number_of_primes) 
    assert (result
      |> Enum.all?(
        fn(x) -> Enum.filter(result, fn(y) -> x != y end)
          |> Enum.all?(fn(y) -> rem(y,x) != 0 end)
        end))
  end do
    [
      {1},
      {4},
      {8},
      {16}
    ]
  end
end
