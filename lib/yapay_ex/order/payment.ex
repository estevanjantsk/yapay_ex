defmodule YapayEx.Order.Payment do
  @moduledoc """
  Payment struct definition.
  """

  @derive Jason.Encoder
  @enforce_keys ~w(payment_method_id)a
  defstruct ~w(
    payment_method_id billet_date_expiration card_name card_number card_expdate_month card_expdate_year card_cvv split
  )a

  @type t :: %__MODULE__{
          payment_method_id: non_neg_integer,
          billet_date_expiration: String.t(),
          card_name: String.t(),
          card_number: String.t(),
          card_expdate_month: non_neg_integer,
          card_expdate_year: non_neg_integer,
          card_cvv: non_neg_integer,
          split: non_neg_integer
        }

  @bankslip_code 6
  def valid?(%__MODULE__{
        payment_method_id: @bankslip_code,
        billet_date_expiration: billet_date_expiration
      })
      when is_nil(billet_date_expiration),
      do: {false, {:billet_date_expiration, "should be present"}}

  def valid?(%__MODULE__{payment_method_id: @bankslip_code}), do: {true, []}

  def valid?(%__MODULE__{} = payment) do
    required_fields =
      ~w(card_name card_number card_expdate_month card_expdate_year card_cvv split)a

    errors =
      required_fields
      |> Enum.reduce(
        [],
        fn field, acc ->
          if is_nil(Map.get(payment, field)),
            do: List.insert_at(acc, -1, {field, "should be present"}),
            else: acc
        end
      )

    {Enum.empty?(errors), errors}
  end
end
