defmodule YapayEx.Order do
  @moduledoc """
  Order struct definition.
  """

  @derive Jason.Encoder
  @enforce_keys ~w(token_account customer transaction_product transaction payment)a
  defstruct ~w(token_account customer transaction_product transaction payment)a

  alias YapayEx.Order.{Customer, Payment, Product, Transaction}

  @type t :: %__MODULE__{
          token_account: String.t(),
          customer: Customer.t(),
          transaction_product: [Product.t()],
          transaction: Transaction.t(),
          payment: Payment.t()
        }
end
