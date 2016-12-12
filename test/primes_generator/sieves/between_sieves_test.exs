defmodule PrimesGenerator.Sieves.BetweenSievesTest do
  use ExUnit.Case
  use ExUnit.Parameterized
  alias PrimesGenerator.Sieves.TrialDivision, as: Trial
  alias PrimesGenerator.Sieves.TrialDivisionImp, as: TrialImp  

  test "TrialDivision and TrialDivisionImp give same result" do
	assert Trial.generate_prime(64) == TrialImp.generate_prime(64)
  end
end
