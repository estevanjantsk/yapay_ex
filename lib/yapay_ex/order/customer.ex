defmodule YapayEx.Order.Customer do
  @moduledoc """
  Customer struct definition.
  """

  alias YapayEx.Order.{Address, Contact}

  @derive Jason.Encoder
  @enforce_keys ~w(contacts name cpf email addresses)a
  defstruct ~w(contacts addresses name cpf email)a

  @type t :: %__MODULE__{
          addresses: [Address.t()],
          contacts: [Contact.t()],
          cpf: String.t(),
          email: String.t(),
          name: String.t()
        }
end
