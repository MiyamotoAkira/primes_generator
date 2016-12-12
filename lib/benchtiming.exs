defmodule BenchTiming do

  def run_trial(number) do
	run(number, &PrimesGenerator.Sieves.TrialDivision.generate_prime/1)
  end

  def run_trial_imp(number) do
	run(number, &PrimesGenerator.Sieves.TrialDivisionImp.generate_prime/1)
  end
    
  def run_for_1000 do
	run(1000, &PrimesGenerator.Sieves.TrialDivision.generate_prime/1)
  end

  def run_for_10000 do
	run(10000, &PrimesGenerator.Sieves.TrialDivision.generate_prime/1)
  end

  def run(number, sieve_function) do
    result = sieve_function.(number)
	{time, _} =  :timer.tc(Multiplication, :cross_multiplication, [result])
	IO.puts time
  end

end
