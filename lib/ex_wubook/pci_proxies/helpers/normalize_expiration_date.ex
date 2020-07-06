defmodule ExWubook.PCIProxies.Helpers.NormalizeExpirationDate do
  @moduledoc """
  This module normalizes the expiration date to the format "MM/YY"
  """
  @doc """
  Normalizes the expiration date to the format "MM/YY"
  """
  @spec execute(String.t()) :: String.t()
  def execute(date) when is_binary(date) do
    date
    |> String.trim()
    |> String.replace("-", "/")
    |> String.replace(".", "/")
    |> String.replace(":", "/")
    |> String.replace(":", "/")
    |> String.replace("\\", "/")
    |> normalize(date)
  end

  defp normalize(<<_month::binary-size(2), "/", _year::binary-size(2)>> = date, raw) do
    date
    |> String.match?(~r|\d\d/\d\d|)
    |> case do
      true -> date
      false -> raw
    end
  end

  defp normalize(<<_month::binary-size(1), "/">> <> _year = date, raw) do
    normalize("0" <> date, raw)
  end

  defp normalize(
         <<month::binary-size(2), "/", _millenium::binary-size(2), year::binary-size(2)>>,
         raw
       ) do
    normalize(month <> "/" <> year, raw)
  end

  defp normalize(_, raw), do: raw
end
