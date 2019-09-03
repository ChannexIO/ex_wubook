defmodule ExWubook.FormattedFloat do

  def convert(list, exponent) when is_list(list), do:  Enum.map(list, &convert(&1, exponent))
  def convert(float, exponent), do: XMLRPC.FormattedFloat.new({float, "~.#{exponent}f"})
end
