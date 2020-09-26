defmodule YapayEx do
  @moduledoc """
  Documentation for `YapayEx`.
  """

  alias YapayEx.{Order, Request}

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
