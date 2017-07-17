defmodule InversionsCount do
  def count(arr), do: sort_and_count(%{ arr: arr })[:count]


  defp sort_and_count(%{ arr: [] }), do: 0
  defp sort_and_count(%{ arr: [_] }), do: 0
  defp sort_and_count(%{ arr: arr }), do: sort_and_count(%{ arr: arr, count: 0 })
  defp sort_and_count(%{ arr: arr, count: count }) do
    { left, right } = split(arr)
    sortedLeft = sort_and_count(%{ arr: left, count: count })
    sortedRight= sort_and_count(%{ arr: right, count: count })
    merge_and_count(%{ left: sortedLeft, right: sortedRight, count: count })
  end

  defp merge_and_count(%{ left: left, right: right, count: count }) do
    merge_and_count(%{ left: left, right: right, result: [], count: count })
  end

  defp merge_and_count(%{ left: [head | tail], right: [], result: result, count: count }) do
    merge_and_count(%{ left: tail, right: [], result: [head | result], count: count })
  end

  defp merge_and_count(%{ left: [], right: [head | tail], result: result, count: count }) do
    merge_and_count(%{ left: [], right: tail, result: [head | result], count: count })
  end

  defp merge_and_count(%{ left: [ lhead | ltail ], right: [ rhead | rtail ], result: result, count: count }) when lhead < rhead do
    merge_and_count(%{ left: ltail, right: [ rhead | rtail ], result: [ lhead, result ], count: count })
  end

  defp merge_and_count(%{ left: [ lhead | ltail ], right: [ rhead | rtail ], result: result, count: count }) when lhead > rhead do
    new_count = count + length(ltail)
    merge_and_count(%{ left: [lhead | ltail], right: rtail, result: [ lhead, result ], count: new_count })
  end

  # defp merge_and_count(arr = [_]), do: 0
  # defp merge_and_count(arr) do
  #   {left, right} = split(arr)
  #   merge_and_count(sort(left), sort(right))
  # end



  # def merge(left, right), do: merge(left, right, [])
  # def merge([], [], result), do: Enum.reverse(result)
  # def merge([head | tail], [], result), do: merge(tail, [], [head | result])
  # def merge([], [head | tail], result), do: merge([], tail, [head | result])
  #
  # def merge([lhead | ltail], [rhead | rtail], result) when lhead < rhead do
  #   merge(ltail, [rhead | rtail], [lhead | result])
  # end
  #
  # def merge([lhead | ltail], [rhead | rtail], result) when lhead >= rhead do
  #   merge([lhead | ltail], rtail, [rhead | result])
  # end

  def split(arr) do
    mid = length(arr) / 2 |> round
    arr |> Enum.split(mid)
  end
end

ExUnit.start
defmodule InversionsCountTest do
  use ExUnit.Case

  setup_all do
    { :ok, input: [3, 4, 2, 5, 2, 1] }
  end

  test "counting empty" do
    assert InversionsCount.count([]) == 0
  end

  test "one element" do
    assert InversionsCount.count([1]) == 0
  end

  test "counting works", state do
    assert InversionsCount.count(state[:input]) == 3
  end
end
