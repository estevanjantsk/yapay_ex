defmodule YapayEx.Order.Contact do
  @moduledoc """
  Contact struct definition.
  """

  @enforce_keys ~w(type_contact number_contact)a
  defstruct type_contact: "H", number_contact: nil

  @type t :: %__MODULE__{
          type_contact: String.t(),
          number_contact: String.t()
        }
end
