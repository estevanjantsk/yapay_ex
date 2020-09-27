defmodule YapayEx.Request do
  @moduledoc """
  Implement functions to request Yapay API.
  """
  alias YapayEx.Config

  def child_spec do
    {Finch,
     name: __MODULE__,
     pools: %{
       get_domain() => [size: pool_size()]
     }}
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

  defp pool_size, do: 25

  defp get_domain do
    System.get_env("MIX_ENV", "test")
    |> String.to_atom()
    |> Config.domain_for()
  end

  defp encode_body(content) do
    content
    |> Jason.encode!()
  end
end
