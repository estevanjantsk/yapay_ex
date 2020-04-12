defmodule YapayEx.PaymentMethods do
  @moduledoc """
  Wrappes all available Yapay payment methods.
  """
  alias YapayEx.PaymentMethod

  # For cards, we can split in 10x without additional taxes and 12x with taxes
  @payment_methods [
    %PaymentMethod{id: 14, name: :peela, max_parcels_number: 1, debit_option?: false},
    %PaymentMethod{id: 15, name: :discover, max_parcels_number: 1, debit_option?: false},
    %PaymentMethod{id: 16, name: :elo, max_parcels_number: 10, debit_option?: false},
    %PaymentMethod{id: 18, name: :aura, max_parcels_number: 10, debit_option?: false},
    %PaymentMethod{id: 19, name: :jcb, max_parcels_number: 1, debit_option?: false},
    %PaymentMethod{id: 2, name: :diners, max_parcels_number: 10, debit_option?: false},
    %PaymentMethod{id: 20, name: :hipercard, max_parcels_number: 10, debit_option?: false},
    %PaymentMethod{id: 22, name: :bradesco_transfer, max_parcels_number: 1, debit_option?: false},
    %PaymentMethod{id: 23, name: :bb_transfer, max_parcels_number: 1, debit_option?: false},
    %PaymentMethod{id: 25, name: :hiper, max_parcels_number: 10, debit_option?: false},
    %PaymentMethod{id: 3, name: :visa, max_parcels_number: 10, debit_option?: false},
    %PaymentMethod{id: 4, name: :mastercard, max_parcels_number: 10, debit_option?: false},
    %PaymentMethod{id: 5, name: :american_express, max_parcels_number: 10, debit_option?: false},
    %PaymentMethod{id: 6, name: :bankslip, max_parcels_number: 1, debit_option?: false},
    %PaymentMethod{id: 7, name: :itau_transfer, max_parcels_number: 1, debit_option?: false},
    %PaymentMethod{id: 8, name: :balance_payment, max_parcels_number: 1, debit_option?: false}
  ]

  def get_payment_method_by(id: id), do: Enum.find(@payment_methods, &(&1.id == id))
  def get_payment_method_by(name: name), do: Enum.find(@payment_methods, &(&1.name == name))
end
