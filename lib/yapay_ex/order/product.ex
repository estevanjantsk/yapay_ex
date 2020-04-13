defmodule YapayEx.Order.Product do
  @moduledoc """
  Product struct definition.
  """

  @enforce_keys ~w(description quantity price_unit code)a
  defstruct ~w(description quantity price_unit code)a

  @type t :: %__MODULE__{
          code: String.t(),
          description: String.t(),
          price_unit: non_neg_integer,
          quantity: non_neg_integer
        }
end
