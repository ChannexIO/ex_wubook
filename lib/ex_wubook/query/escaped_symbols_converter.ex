defmodule ExWubook.Query.EscapedSymbolsConverter do
  @moduledoc """
  Helpers module
  """

  @doc """
  Converts escaped character to regular character on values ​​inside nested lists or maps
  """
  @spec convert(any) :: any
  def convert(list) when is_list(list), do: Enum.map(list, &convert/1)

  def convert(map) when is_map(map) do
    Enum.reduce(map, %{}, fn {key, value}, acc ->
      Map.put(acc, key, convert(value))
    end)
  end

  def convert(string) when is_binary(string), do: HtmlEntities.decode(string)
  def convert(any), do: any
end
