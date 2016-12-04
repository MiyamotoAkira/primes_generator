defmodule PrimesGeneratorTest do
  use ExUnit.Case
  doctest PrimesGenerator
  import PrimesGenerator

  test "When asking for single prime it will return just 2" do
    assert [2] == PrimesGenerator.generate_prime 1
  end

  test "When asking for two primes it will return 2 and 3" do
    assert [2, 3] == PrimesGenerator.generate_prime 2
  end
end
