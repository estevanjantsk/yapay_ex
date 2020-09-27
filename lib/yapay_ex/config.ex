defmodule YapayEx.Config do
  @moduledoc """
  Defines Yapay configs for domain by each env, transaction statuses, etc.
  """

  def domain_for(:production), do: "https://api.intermediador.yapay.com.br/api/v3"

  def domain_for(:development), do: "https://api.intermediador.sandbox.yapay.com.br/api/v3"

  def domain_for(:test), do: "http://localhost:1337/api/v3"

  @doc """

  """
  def address_type(:charging), do: "B"
  def address_type(:delivery), do: "D"

  @transaction_statuses %{
    4 => :waiting_payment,
    5 => :processing,
    6 => :approved,
    7 => :cancelled,
    24 => :contestation,
    87 => :monitoring,
    88 => :recovering,
    89 => :refused
  }

  def get_payment_status_by_id(id), do: @transaction_statuses[id]
end
