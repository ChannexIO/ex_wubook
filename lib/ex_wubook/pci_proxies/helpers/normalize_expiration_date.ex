defmodule ExWubook.PCIProxies.Helpers.NormalizeExpirationDate do
  @moduledoc """
  This module normalizes the expiration date to the format "MM/YYYY"
  """
  @doc """
  Normalizes the expiration date to the format "MM/YYYY"
  """
  @spec execute(String.t()) :: String.t()
  def execute(date) when is_binary(date) do
    date
    |> String.trim()
    |> String.replace(~r/[[:punct:]]+/, "/")
    |> normalize(date)
  end

  defp normalize(<<_month::binary-size(1), "/">> <> _year = date, raw) do
    normalize("0" <> date, raw)
  end

  defp normalize(<<month::binary-size(2), year::binary-size(2)>>, raw) do
    century = String.slice("#{Date.utc_today().year}", 0, 2)
    normalize(month <> "/" <> century <> year, raw)
  end

  defp normalize(<<month::binary-size(2), year::binary-size(4)>>, raw) do
    normalize(month <> "/" <> year, raw)
  end

  defp normalize(<<month::binary-size(2), "/", year::binary-size(2)>>, raw) do
    century = String.slice("#{Date.utc_today().year}", 0, 2)
    normalize(month <> "/" <> century <> year, raw)
  end

  defp normalize(<<_month::binary-size(2), "/", _year::binary-size(4)>> = date, raw) do
    if String.replace(date, ~r|\d{2}/\d{4}|, "") == "", do: date, else: raw
  end

  defp normalize(_, raw), do: raw
end
