defmodule YapayEx.RequestTest do
  use ExUnit.Case

  alias YapayEx.Request
  alias Fixtures.{FakeOrder, YapayResponses}

  describe "create_order/1" do
    setup do
      bypass = Bypass.open()
      endpoint = yapay_endpoint(bypass)
      System.put_env("YAPAY_DOMAIN", endpoint)

      {:ok, bypass: bypass}
    end

    test "creates an order", %{bypass: bypass} do
      response = YapayResponses.load("card_transaction_response")

      Bypass.expect(
        bypass,
        "POST",
        "/api/v3/transactions/payment",
        fn conn ->
          conn
          |> Plug.Conn.put_resp_header("content-type", "application/json")
          |> Plug.Conn.resp(200, response)
        end
      )

      order = FakeOrder.credit_card()
      decoded_response = Jason.decode!(response)

      assert {:ok, 200, ^decoded_response} = Request.create_order(order)
    end

    defp yapay_endpoint(%{port: port}), do: "http://localhost:#{port}"
  end
end
