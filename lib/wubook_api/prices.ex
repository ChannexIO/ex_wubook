defmodule WubookAPI.Prices do
  @moduledoc """
  API Methods for Availability operations
  """
  alias WubookAPI.Token
  alias WubookAPI.Query

  defmacro __using__(_) do
    quote do
      @doc """
      Add Pricing Plan
      """
      @spec add_pricing_plan(%Token{}, String.t(), 0 | 1) :: {:ok, map()} | {:error, any()}
      def add_pricing_plan(%Token{token: token, lcode: lcode}, name, daily \\ 1) do
        with {:ok, [id]} <- Query.send("add_pricing_plan", [token, lcode, name, daily]) do
          {:ok, %{pricing_plan_id: id}}
        end
      end

      @doc """
      Add Virtual Pricing Plan
      """
      @spec add_vplan(%Token{}, String.t(), integer(), -2 | -1 | 1 | 2, number()) :: {:ok, map()} | {:error, any()}
      def add_vplan(%Token{token: token, lcode: lcode}, name, pid, dtype, value) do
        with {:ok, [id]} <- Query.send("add_vplan", [token, lcode, name, pid, dtype, value]) do
          {:ok, %{pricing_plan_id: id}}
        end
      end

      @doc """
      Remove Pricing plan
      """
      @spec del_plan(%Token{}, integer()) :: {:ok, nil} | {:error, any()}
      def del_plan(%Token{token: token, lcode: lcode}, pid) do
        with {:ok, _} <- Query.send("del_plan", [token, lcode, pid]) do
          {:ok, nil}
        end
      end

      @doc """
      Update Pricing plan name
      """
      @spec update_plan_name(%Token{}, integer(), String.t()) :: {:ok, nil} | {:error, any()}
      def update_plan_name(%Token{token: token, lcode: lcode}, pid, name) do
        with {:ok, _} <- Query.send("update_plan_name", [token, lcode, pid, name]) do
          {:ok, nil}
        end
      end

      @doc """
      Get Pricing Plans
      """
      @spec get_pricing_plans(%Token{}) :: {:ok, list()} | {:error, any()}
      def get_pricing_plans(%Token{token: token, lcode: lcode}) do
        with {:ok, [plans]} <- Query.send("get_pricing_plans", [token, lcode]) do
          {:ok, plans}
        end
      end

      @doc """
      Update Pricing plan default values
      """
      @spec update_plan_rack(%Token{}, integer(), map()) :: {:ok, nil} | {:error, any()}
      def update_plan_rack(%Token{token: token, lcode: lcode}, pid, rack) do
        with {:ok, _} <- Query.send("update_plan_rack", [token, lcode, pid, rack]) do
          {:ok, nil}
        end
      end

      @doc """
      Modify Virtual Pricing plans
      """
      @spec mod_vplans(%Token{}, list()) :: {:ok, nil} | {:error, any()}
      def mod_vplans(%Token{token: token, lcode: lcode}, plans) do
        with {:ok, _} <- Query.send("mod_vplans", [token, lcode, plans]) do
          {:ok, nil}
        end
      end

      @doc """
      Update Pricing plan prices
      """
      @spec update_plan_prices(%Token{}, integer(), Date.t(), map()) :: {:ok, nil} | {:error, any()}
      def update_plan_prices(%Token{token: token, lcode: lcode}, pid, dfrom, prices) do
        with {:ok, _} <- Query.send("update_plan_prices", [token, lcode, pid, dfrom, prices]) do
          {:ok, nil}
        end
      end

      @doc """
      Fetch plan prices
      """
      @spec fetch_plan_prices(%Token{}, integer(), Date.t(), Date.t(), list()) :: {:ok, map()} | {:error, any()}
      def fetch_plan_prices(%Token{token: token, lcode: lcode}, pid, dfrom, dto, rooms \\ []) do
        with {:ok, [prices]} <- Query.send("fetch_plan_prices", [token, lcode, pid, dfrom, dto, rooms]) do
          {:ok, prices}
        end
      end

      @doc """
      Convert to daily plan
      """
      @spec convert_to_daily_plan(%Token{}, integer()) :: {:ok, nil} :: {:error, any()}
      def convert_to_daily_plan(%Token{token: token, lcode: lcode}, pid) do
        with {:ok, _} <- Query.send("convert_to_daily_plan", [token, lcode, pid]) do
          {:ok, nil}
        end
      end

      @doc """
      Update plan periods
      """
      @spec update_plan_periods(%Token{}, integer(), list()) :: {:ok, nil} | {:error, any()}
      def update_plan_periods(%Token{token: token, lcode: lcode}, pid, periods) do
        with {:ok, _} <- Query.send("update_plan_periods", [token, lcode, pid, periods]) do
          {:ok, nil}
        end
      end

      @doc """
      Remove periods
      """
      @spec delete_periods(%Token{}, integer(), list()) :: {:ok, nil} | {:error, any()}
      def delete_periods(%Token{token: token, lcode: lcode}, pid, periods) do
        with {:ok, _} <- Query.send("delete_periods", [token, lcode, pid, periods]) do
          {:ok, nil}
        end
      end
    end
  end
end
