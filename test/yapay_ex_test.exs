defmodule YapayExTest do
  use ExUnit.Case
  doctest YapayEx

  alias Fixtures.{FakeOrder, YapayResponses}

  describe "create_order/1" do
    setup do
      bypass = Bypass.open(port: 1337)

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

      assert {:ok, 200, ^decoded_response} = YapayEx.create_order(order)
    end
  end
end
