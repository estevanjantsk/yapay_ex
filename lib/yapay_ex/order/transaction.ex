defmodule YapayEx.Order.Transaction do
  @moduledoc """
  Transaction struct definition.
  """

  @enforce_keys ~w(customer_ip url_notification)a
  defstruct ~w(customer_ip url_notification)a

  @type t :: %__MODULE__{
          customer_ip: String.t(),
          url_notification: String.t()
        }
end
