defmodule BenchTiming do
  @moduledoc """
  This is the benchmarking module.

  Quite simple, it uses the Erlang Timer library. At the moment it captures both main operations on a single method call and outputs im the console. Need improvement
  """

  @doc """
  Executes the code using Trial Division until it gets `number` of prime numbers

  ## Example

    iex> BenchTiming.run_trial(5)
    :ok
  """
  def run_trial(number) do
    run(number, &PrimesGenerator.Sieves.TrialDivision.generate_prime/1)
  end

  def run_trial_imp(number) do
    run(number, &PrimesGenerator.Sieves.TrialDivisionImp.generate_prime/1)
  end
    
  defp run(number, sieve_function) do
    {time, result} = :timer.tc(sieve_function, [number])
    IO.puts time
    {time, _} =  :timer.tc(Multiplication, :cross_multiplication, [result])
    IO.puts time
  end

end
