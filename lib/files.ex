defmodule Files do

  def sort_csv_columns(csv_data) do
    lines = String.split(csv_data, "\n")
    lines
    |> Enum.with_index
    |> Enum.map(fn {line, order} ->
      if order == 0 do
        get_header(line, false)
        |> Enum.join(",")
      else
        order_list = lines
        |> Enum.at(0)
        |> get_header

        columns = String.split(line, ",")
        columns
        |> Enum.with_index
        |> Enum.map(fn {_value, order} ->
          Enum.at(columns, Enum.at(order_list, order))
        end)
        |> Enum.join(",")
      end
    end)
    |> Enum.join("\n")
  end

  defp get_header(line, get_orders \\ true) do
    String.split(line, ",")
    |> Enum.with_index
    |> Enum.sort()
    |> Enum.map(fn {value, order} -> if get_orders == true, do: order, else: value end)
  end

end
