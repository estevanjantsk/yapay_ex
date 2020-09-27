defmodule YapayEx do
  @moduledoc """
  Documentation for `YapayEx`.
  """

  use Application

  alias YapayEx.{Order, Request}

  def start(_type, _args) do
    children = [
      {Finch, name: YapayEx.Finch}
    ]

    opts = [strategy: :one_for_one, name: YapayEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def create_order(%Order{} = order) do
    endpoint = "/transactions/payment"

    case Request.post(endpoint, order) do
      {:ok, %{status: status, body: body}} when status in 200..299 ->
        {:ok, status, body}

      {_, %{status: status, body: body}} ->
        {:error, status, body}
    end
  end
end
