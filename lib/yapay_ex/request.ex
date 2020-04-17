defmodule YapayEx.Request do
  use Tesla

  plug(
    Tesla.Middleware.BaseUrl,
    System.get_env("MIX_ENV", "test")
    |> String.to_existing_atom()
    |> Config.domain_for()
  )

  plug(Tesla.Middleware.JSON)

  adapter(Tesla.Adapter.Hackney, recv_timeout: 30_000)

  alias YapayEx.{Config, Order}

  def create_order(%Order{} = order) do
    endpoint = "/transactions/payment"

    case post(endpoint, order) do
      {:ok, %{status: status}} = response when status in [200..299] ->
        response

      {_, %{status: status} = body} ->
        {:error, body}
    end
  end
end
