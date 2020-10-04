defmodule YapayEx.Request do
  @moduledoc """
  Implement functions to request Yapay API.
  """
  alias YapayEx.Config

  def child_spec do
    {
      Finch,
      name: __MODULE__
    }
  end

  def post(endpoint, order) do
    :post
    |> Finch.build(
      "#{get_domain()}#{endpoint}",
      [{"Content-Type", "application/json"}],
      encode_body(order)
    )
    |> Finch.request(__MODULE__)
  end

  defp get_domain do
    Config.domain_for(Mix.env())
  end

  defp encode_body(content) do
    content
    |> Jason.encode!()
  end
end
