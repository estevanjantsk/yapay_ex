defmodule YapayEx.Order.Address do
  @moduledoc """
  Address struct definition.
  """

  @enforce_keys ~w(type_address postal_code street number neighborhood city state)a
  defstruct ~w(type_address postal_code street number completion neighborhood city state)a

  @type t :: %__MODULE__{
          type_address: String.t(),
          postal_code: String.t(),
          street: String.t(),
          number: String.t(),
          completion: String.t(),
          neighborhood: String.t(),
          city: String.t(),
          state: String.t()
        }
end
