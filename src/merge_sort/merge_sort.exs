defmodule MergeSort do
  def sort([]), do: []
  def sort(arr = [_]), do: arr
  def sort(arr) do
    {left, right} = split(arr)
    merge(sort(left), sort(right))
  end

  def merge(left, right), do: merge(left, right, [])
  def merge([], [], result), do: Enum.reverse(result)
  def merge([head | tail], [], result), do: merge(tail, [], [head | result])
  def merge([], [head | tail], result), do: merge([], tail, [head | result])

  def merge([lhead | ltail], [rhead | rtail], result) when lhead < rhead do
    merge(ltail, [rhead | rtail], [lhead | result])
  end

  def merge([lhead | ltail], [rhead | rtail], result) when lhead >= rhead do
    merge([lhead | ltail], rtail, [rhead | result])
  end

  def split(arr) do
    mid = length(arr) / 2 |> round
    arr |> Enum.split(mid)
  end
end

ExUnit.start
defmodule MergeSortTest do
  use ExUnit.Case

  setup_all do
    { :ok, input: [3, 4, 2, 5, 2, 1] }
  end

  test "sorting empty" do
    assert MergeSort.sort([]) == []
  end

  test "sorting works", state do
    assert MergeSort.sort(state[:input]) == [1, 2, 2, 3, 4, 5]
  end
end
