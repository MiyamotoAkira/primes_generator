defmodule PrimesGeneratorTest do
  use ExUnit.Case
  doctest PrimesGenerator
  import PrimesGenerator

  test "When asking for single prime it will return just 2" do
    assert [2] == PrimesGenerator.generate_prime 1
  end
end
