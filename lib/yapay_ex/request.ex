defmodule YapayEx.Request do
  @moduledoc """
  Implement functions to request Yapay API.
  """

  use Tesla

  alias YapayEx.{Config, Order}

  plug(
    Tesla.Middleware.BaseUrl,
    System.get_env("MIX_ENV", "test")
    |> String.to_existing_atom()
    |> Config.domain_for()
  )

  plug(Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"}
  ])

  plug(Tesla.Middleware.JSON)

  adapter(Tesla.Adapter.Hackney, recv_timeout: 30_000)

  @spec create_order(YapayEx.Order.t()) ::
          {:ok, Integer.t(), Map.t()} | {:error, Integer.t(), Map.t()}
  def create_order(%Order{} = order) do
    endpoint = "/transactions/payment"

    case post(endpoint, %Order{} = order) do
      {:ok, %{status: status, body: body}} when status in 200..299 ->
        {:ok, status, body}

      {_, %{status: status, body: body}} ->
        {:error, status, body}
    end
  end
end
