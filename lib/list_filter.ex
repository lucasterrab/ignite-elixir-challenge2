defmodule ListFilter do
  def call(list), do: list_filter(list)

  defp list_filter([]), do: 0

  defp list_filter(list) do
    Enum.flat_map(list, fn elem ->
      case Integer.parse(elem) do
        {int, _rest} -> [int]
        :error -> []
      end
    end)
    |> Enum.filter(fn x -> rem(x, 2) != 0 end)
    |> Enum.count()
  end
end
