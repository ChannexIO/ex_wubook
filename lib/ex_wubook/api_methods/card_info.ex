defmodule ExWubook.CardInfo do
  @moduledoc """
  This module fetches card info from Wubook through custom provider
  """
  alias ExWubook.PCIProxies.{ChannexPCI, PCIBooking}

  @doc """
  Fetch credit card info from Wubook through custom provider
  """
  @spec fetch_card_info(map(), String.t(), String.t(), :channex_pci | :pci_booking) ::
          {:ok, map()}
          | {:error, :no_cc_for_this_reservation}
          | {:error, :invalid_input}
          | {:error, any()}
  def fetch_card_info(token, booking_code, api_key, :channex_pci) do
    ChannexPCI.fetch_card_info(token, booking_code, api_key)
  end

  def fetch_card_info(token, booking_code, api_key, :pci_booking) do
    PCIBooking.fetch_card_info(token, booking_code, api_key)
  end
end
