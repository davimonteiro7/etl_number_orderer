defmodule EtlNumberOrderer.Transform do

  def call({:error, reason}), do: {:error, reason}
  def call(numbers) do
    :logger.info("Transform - sorting all numbers.")
    sorted_numbers = merge_sort(numbers)
      |> Enum.filter(fn num -> num != nil end)
      |> Enum.map(fn num -> :erlang.float_to_binary(num, [decimals: 20]) end)
    {:ok, sorted_numbers}
  end

  defp merge_sort(list) when length(list) <= 1, do: list
  defp merge_sort(list) do
    {left, right} = Enum.split(list, div(length(list), 2))
    merge(merge_sort(left), merge_sort(right))
  end

  defp merge(left, right), do: merge(left, right, [])
  defp merge([], [], current_list), do: Enum.reverse(current_list)
  defp merge([header | tail], [], current_list), do: merge(tail, [], [header | current_list])
  defp merge([], [header | tail], current_list), do: merge([], tail, [header | current_list])
  defp merge([left_header | left_tail], [right_header | right_tail], current_list) when  left_header >= right_header do
    merge([left_header | left_tail], right_tail, [right_header | current_list])
  end
  defp merge([left_header | left_tail], [right_header | right_tail], current_list) when left_header < right_header do
    merge(left_tail, [right_header | right_tail], [left_header | current_list])
  end
end
