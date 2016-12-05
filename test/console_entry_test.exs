defmodule ConsoleEntryTest do
  use ExUnit.Case
  use ExUnit.Parameterized
  import ConsoleEntry

  test_with_params "Passing any invalid should return an invalid result",
  fn(args) ->
	assert {:invalid, _ } =  ConsoleEntry.parse_args(args)
  end do
	[
	  {["a"]},
	  {[":notvalid"]},
	  {["1", "notvalid"]},
	  {[":help", ":notvalid"]},
	  {["--notvalid", "--help", "2"]}
	]
  end

  test_with_params "Passing valid with help always returns help",
  fn(args) ->
	assert :help = ConsoleEntry.parse_args(args)
  end do
	[
	  {["--help"]},
	  {["-h", "1"]},
	  {["3", "-h"]}
	]
  end

  test "Passing just a number will return ok and the number" do
	assert {:ok, 3} = ConsoleEntry.parse_args(["3"])
  end

  test "When invalid is passed with just a string, a string with the invalid parameter is returned" do
	result = ConsoleEntry.process({:invalid, "a"})
	assert is_binary(result)
	assert String.contains?(result, " a")
  end

  test "When invalid is passed with an array, a string with the invalid parameters is returned" do
	result = ConsoleEntry.process({:invalid, ["a", "notvalid"]})
	assert is_binary(result)
	assert String.contains?(result, " a notvalid")
  end

  test "When help is requested, a string with help is returned" do
	result = ConsoleEntry.process(:help)
	assert is_binary(result)
	assert String.contains?(result, " help ")
  end

  test_with_params "When a value less than 1 is passed, is should be an invalid result",
  fn(x) ->
	assert {:invalid, -1} = ConsoleEntry.parse_args(["-1"])
  end do
	[
	  {0},
	  {-1},
	  {-100}
	]
  end
end
