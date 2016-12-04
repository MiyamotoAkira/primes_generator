defmodule PrimesGeneratorTest do
  use ExUnit.Case
  use ExUnit.Parameterized
  doctest PrimesGenerator
  import PrimesGenerator

  test "When asking for single prime it will return just 2" do
    assert [2] == PrimesGenerator.generate_prime 1
  end

  test "When asking for two primes it will return 2 and 3" do
    assert [2, 3] == PrimesGenerator.generate_prime 2
  end

  test_with_params "When asking for a number of primes, that amount should be returned",
  fn(number_of_primes) ->
	assert Enum.count(PrimesGenerator.generate_prime(number_of_primes)) == number_of_primes
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
	assert (PrimesGenerator.generate_prime(number_of_primes)
	  |> Enum.drop(1)
	  |> Enum.all?(fn(x) -> rem(x,2) ==1 end))
  end do
	[
	  {1},
	  {4},
	  {8},
	  {16}
	]
  end
end
