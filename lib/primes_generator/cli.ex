defmodule PrimesGenerator.CLI do

  @error_message "You have passed the following incorrect values:"
  @command_suggestion "The following is the expected input:"
  @command_option "console_entry <number_of_primes>|[--help|-h]"
  @positive_integer "where number_of_primes is bigger than 0"
  @first_line "console_entry will help you on finding the multiples of a selection of primes."
  @second_line "The only parameter needed is the number of primes that you want to use"
  @example_string "The following is an example"
  @example "console_entry 3"
  @solution_info "The results are as follow:"

  def main(args) do
    args
    |> parse_args
    |> process
    |> IO.puts
  end

  def parse_args(args) do
    {switches, number_of_primes, invalid} = OptionParser.parse(args, strict: [help: :boolean], aliases: [h: :help])
    cond do
      Enum.count(invalid) > 0 -> {:invalid, invalid}
      Enum.count(switches) > 0 -> :help
      Enum.count(number_of_primes) == 1 ->
        case Integer.parse(List.first(number_of_primes)) do
          :error -> {:invalid, List.first(number_of_primes)}
          {value, _ } when value < 1 -> {:invalid, value}
          {value, _} -> {:ok, value}
        end
      true -> {:invalid, number_of_primes}
    end
  end

  def process({:invalid, value}), do: craft_invalid_message(value)
  def process(:help), do: craft_help_message()
  def process({:ok, value}), do: craft_solution_message(value)

  defp craft_invalid_message(value) do
    formatted =
        if is_list(value) do
          Enum.join(value, " ")
        else
          value
        end
        
    "#{@error_message} #{formatted}\n#{@command_suggestion}\n#{@command_option}\n#{@positive_integer}"
  end

  defp craft_help_message() do
    "#{@first_line}\n#{@second_line}\n#{@command_option}\n\n#{@example_string}\n#{@example}"
  end

  defp craft_solution_message(value) do
    result = value
    |> PrimesGenerator.Sieves.TrialDivision.generate_prime
    |> Multiplication.cross_multiplication

    output = Enum.reduce(result,"",  fn(x, acc) -> acc <> Enum.join(x, " ") <> "\n" end)
    "#{@solution_info}\n#{output}"
  end
end
