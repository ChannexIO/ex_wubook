defmodule ExWubook.Channels do
  @moduledoc """
  API Methods for Channel operations
  """
  alias ExWubook.Token
  alias ExWubook.Query
  alias ExWubook.Meta
  import ExWubook.Date, only: [date_format: 1]

  defmacro __using__(_) do
    quote do
      @spec get_channels_info(%Token{}) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def get_channels_info(%Token{token: token}) do
        with {:ok, [result], meta} <- Query.send("get_channels_info", [token]) do
          {:ok, result, meta}
        end
      end

      @spec get_otas(%Token{}) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def get_otas(%Token{token: token, lcode: lcode}) do
        with {:ok, [result], meta} <- Query.send("get_otas", [token, lcode]) do
          {:ok, result, meta}
        end
      end

      @spec tag_ota(%Token{}, any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def tag_ota(%Token{token: token, lcode: lcode}, chid, tag) do
        with {:ok, [result], meta} <- Query.send("tag_ota", [token, lcode, chid, tag]) do
          {:ok, result, meta}
        end
      end

      @spec new_ota(%Token{}, any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def new_ota(%Token{token: token, lcode: lcode}, ctype, tag \\ nil) do
        with {:ok, [result], meta} <- Query.send("new_ota", [token, lcode, ctype, tag]) do
          {:ok, result, meta}
        end
      end

      @spec ota_running(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def ota_running(%Token{token: token, lcode: lcode}, chid) do
        with {:ok, [result], meta} <- Query.send("ota_running", [token, lcode, chid]) do
          {:ok, result, meta}
        end
      end

      @spec fetch_rsrv_errors(%Token{}) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def fetch_rsrv_errors(%Token{token: token, lcode: lcode}) do
        with {:ok, [result], meta} <- Query.send("fetch_rsrv_errors", [token, lcode]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_start_procedure(%Token{}, any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_start_procedure(%Token{token: token, lcode: lcode}, chid, bhid) do
        with {:ok, [result], meta} <- Query.send("bcom_start_procedure", [token, lcode, chid, bhid]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_confirm_activation(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_confirm_activation(%Token{token: token, lcode: lcode}, chid) do
        with {:ok, [result], meta} <- Query.send("bcom_confirm_activation", [token, lcode, chid]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_init_channel(%Token{}, any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_init_channel(%Token{token: token, lcode: lcode}, chid, currency) do
        with {:ok, [result], meta} <- Query.send("bcom_init_channel", [token, lcode, chid, currency]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_rooms_rates(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_rooms_rates(%Token{token: token, lcode: lcode}, chid) do
        with {:ok, [result], meta} <- Query.send("bcom_rooms_rates", [token, lcode, chid]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_set_room_mapping(%Token{}, any(), any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_set_room_mapping(%Token{token: token, lcode: lcode}, chid, rmap, singlemap \\ nil) do
        with {:ok, [result], meta} <- Query.send("bcom_set_room_mapping", [token, lcode, chid, rmap, singlemap]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_set_rate_mapping(%Token{}, any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_set_rate_mapping(%Token{token: token, lcode: lcode}, chid, rmap) do
        with {:ok, [result], meta} <- Query.send("bcom_set_rate_mapping", [token, lcode, chid, rmap]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_read_allotments(%Token{}, any(), any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_read_allotments(%Token{token: token, lcode: lcode}, chid, dfrom, days) do
        with {:ok, [result], meta} <- Query.send("bcom_read_allotments", [token, lcode, chid, date_format(dfrom), days]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_notify_noshow(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_notify_noshow(%Token{token: token, lcode: lcode}, rcode) do
        with {:ok, [result], meta} <- Query.send("bcom_notify_noshow", [token, lcode, rcode]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_notify_invalid_cc(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_notify_invalid_cc(%Token{token: token, lcode: lcode}, rcode) do
        with {:ok, [result], meta} <- Query.send("bcom_notify_invalid_cc", [token, lcode, rcode]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_get_advance_booking(%Token{}, any(), any(), any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_get_advance_booking(%Token{token: token, lcode: lcode}, self, ip, ses, chid) do
        with {:ok, [result], meta} <- Query.send("bcom_get_advance_booking", [self, ip, token, ses, lcode, chid]) do
          {:ok, result, meta}
        end
      end

      @spec bcom_set_advanced_booking(%Token{}, any(), any(), any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def bcom_set_advanced_booking(%Token{token: token, lcode: lcode}, ip, ses, chid, advanced_res) do
        with {:ok, [result], meta} <- Query.send("bcom_set_advanced_booking", [ip, token, ses, lcode, chid, advanced_res]) do
          {:ok, result, meta}
        end
      end

      @spec exp_start_procedure(%Token{}, any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def exp_start_procedure(%Token{token: token, lcode: lcode}, chid, ehid) do
        with {:ok, [result], meta} <- Query.send("exp_start_procedure", [token, lcode, chid, ehid]) do
          {:ok, result, meta}
        end
      end

      @spec exp_vat_models(%Token{}) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def exp_vat_models(%Token{token: token}) do
        with {:ok, [result], meta} <- Query.send("exp_vat_models", [token]) do
          {:ok, result, meta}
        end
      end

      @spec exp_init_channel(%Token{}, any(), any(), any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def exp_init_channel(%Token{token: token, lcode: lcode}, chid, currency, fee, vat_taxes) do
        with {:ok, [result], meta} <- Query.send("exp_init_channel", [token, lcode, chid, currency, fee, vat_taxes]) do
          {:ok, result, meta}
        end
      end

      @spec exp_rooms_rates(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def exp_rooms_rates(%Token{token: token, lcode: lcode}, chid) do
        with {:ok, [result], meta} <- Query.send("exp_rooms_rates", [token, lcode, chid]) do
          {:ok, result, meta}
        end
      end

      @spec exp_set_room_mapping(%Token{}, any(), any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def exp_set_room_mapping(%Token{token: token, lcode: lcode}, chid, rmap, allots \\ nil) do
        with {:ok, [result], meta} <- Query.send("exp_set_room_mapping", [token, lcode, chid, rmap, allots]) do
          {:ok, result, meta}
        end
      end

      @spec exp_set_rate_mapping(%Token{}, any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def exp_set_rate_mapping(%Token{token: token, lcode: lcode}, chid, rmap) do
        with {:ok, [result], meta} <- Query.send("exp_set_rate_mapping", [token, lcode, chid, rmap]) do
          {:ok, result, meta}
        end
      end

      @spec exp_set_preferences(%Token{}, any(), any(), any(), any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def exp_set_preferences(%Token{token: token, lcode: lcode}, chid, hct, minstay_error_behaviour, minstay_type, last_rate \\ nil) do
        with {:ok, [result], meta} <- Query.send("exp_set_preferences", [token, lcode, chid, hct, minstay_error_behaviour, minstay_type, last_rate]) do
          {:ok, result, meta}
        end
      end

      @spec woodoo_suspended_commands(%Token{}) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def woodoo_suspended_commands(%Token{token: token, lcode: lcode}) do
        with {:ok, [result], meta} <- Query.send("woodoo_suspended_commands", [token, lcode]) do
          {:ok, result, meta}
        end
      end

      @spec woodoo_executed_commands(%Token{}, any(), any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def woodoo_executed_commands(%Token{token: token, lcode: lcode}, day, id_channel \\ 0) do
        with {:ok, [result], meta} <- Query.send("woodoo_executed_commands", [token, lcode, day, id_channel]) do
          {:ok, result, meta}
        end
      end

      @spec woodoo_cancel_suspended(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def woodoo_cancel_suspended(%Token{token: token, lcode: lcode}, trackings) do
        with {:ok, [result], meta} <- Query.send("woodoo_cancel_suspended", [token, lcode, trackings]) do
          {:ok, result, meta}
        end
      end

      @spec woodoo_relaunch_suspended(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def woodoo_relaunch_suspended(%Token{token: token, lcode: lcode}, trackings) do
        with {:ok, [result], meta} <- Query.send("woodoo_relaunch_suspended", [token, lcode, trackings]) do
          {:ok, result, meta}
        end
      end

      @spec last_room_channels(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def last_room_channels(%Token{token: token, lcode: lcode}, up_channels \\ nil) do
        with {:ok, [result], meta} <- Query.send("last_room_channels", [token, lcode, up_channels]) do
          {:ok, result, meta}
        end
      end

      @spec woodoo_basic_yield(%Token{}, any()) :: {:ok, any(), %Meta{}} | {:error, any(), %Meta{}}
      def woodoo_basic_yield(%Token{token: token, lcode: lcode}, up_channels \\ nil) do
        with {:ok, [result], meta} <- Query.send("woodoo_basic_yield", [token, lcode, up_channels]) do
          {:ok, result, meta}
        end
      end
    end
  end
end
