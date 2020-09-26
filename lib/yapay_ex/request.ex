defmodule YapayEx.Request do
  @moduledoc """
  Implement functions to request Yapay API.
  """

  use Tesla

  alias YapayEx.Config

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
end
