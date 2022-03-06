defmodule Conversions do
  @roman_chars %{
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  @integer_to_roman %{
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    6 => "VI",
    7 => "VII",
    8 => "VIII",
    9 => "IX",
    10 => "X",
    20 => "XX",
    30 => "XXX",
    40 => "XL",
    50 => "L",
    60 => "LX",
    70 => "LXX",
    80 => "LXXX",
    90 => "XC",
    100 => "C",
    200 => "CC",
    300 => "CCC",
    400 => "CD",
    500 => "D",
    600 => "DC",
    700 => "DCC",
    800 => "DCCC",
    900 => "CM",
    1000 => "M",
    2000 => "MM",
    3000 => "MMM"
  }

  def roman_to_int(roman) do
    roman
    |> reversed_roman
    |> Enum.reduce({nil, 0}, fn char, {last, add} -> {char, calc_roman(char, last, add)} end)
    |> elem(1)
  end

  def int_to_roman(int) do
    translate_number(int)
    |> Enum.map_join(&Map.get(@integer_to_roman, &1))
  end

  defp translate_number(number) when number > 3999 do
    raise ArgumentError, message: "The number must be less than 4000."
  end

  defp translate_number(number) when number > 999 do
    [1000 * div(number, 1000), 100 * div(rem(number, 1000), 100),
      10 * div(rem(number, 100), 10), rem(number, 10)]
  end

  defp translate_number(number) when number > 99 do
    [100 * div(number, 100), 10 * div(rem(number, 100), 10), rem(number, 10)]
  end

  defp translate_number(number) when number > 9 do
    [10 * div(number, 10), rem(number, 10)]
  end

  defp translate_number(number) when number > 0, do: [number]

  defp translate_number(_) do
    raise ArgumentError, message: "Invalid integer number."
  end

  defp reversed_roman(roman) do
    roman
    |> String.codepoints
    |> Enum.reverse
    |> Enum.map(fn c -> @roman_chars[c] end)
  end

  defp calc_roman(char, nil, add), do: char + add

  defp calc_roman(char, last, add), do: char * operator(char, last) + add

  defp operator(char, last), do: if char >= last, do: 1, else: -1

end
