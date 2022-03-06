defmodule ConversionsTest do
  use ExUnit.Case
  doctest Conversions

  test "convert 1972 to roman" do
    assert Conversions.int_to_roman(1972) == "MCMLXXII"
  end

  test "convert XVIII to integer" do
    assert Conversions.roman_to_int("XVIII") == 18
  end
end
