defmodule YapayEx.PaymentMethod do
  @moduledoc """
  PaymentMethod struct definition.
  """
  @enforce_keys ~w(id name max_parcels_number)a
  defstruct ~w(id name max_parcels_number debit_option?)a

  @type t :: %__MODULE__{
          id: non_neg_integer,
          name: String.t(),
          max_parcels_number: non_neg_integer,
          debit_option?: Boolean.t()
        }
end
