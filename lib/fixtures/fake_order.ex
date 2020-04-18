defmodule Fixtures.FakeOrder do
  @moduledoc """
  Add functions that create fake orders for test purpose
  """

  alias YapayEx.{Order, PaymentMethods}

  alias YapayEx.Order.{
    Address,
    Contact,
    Customer,
    Payment,
    Product,
    Transaction
  }

  def credit_card do
    default_order()
  end

  @bankslip_code 6
  def billet do
    default_order()
    |> Map.replace!(
      :payment,
      %Payment{
        payment_method_id: @bankslip_code,
        billet_date_expiration: "18/08/2020"
      }
    )
  end

  defp default_order do
    %Order{
      token_account: "xxxxx",
      customer: %Customer{
        cpf: "16970449050",
        email: "tony.stark@avengers.com",
        name: "Tony Stark",
        contacts: [
          %Contact{
            type_contact: "H",
            number_contact: "14991233244"
          }
        ],
        addresses: [
          %Address{
            type_address: "B",
            postal_code: "17340000",
            street: "Rua Waldomiro Pastori",
            number: "51",
            completion: "Casa",
            neighborhood: "Sonho Nosso II",
            city: "Barra Bonita",
            state: "SP"
          }
        ]
      },
      transaction_product: [
        %Product{
          code: "product-xpto",
          description: "Product XPTO",
          price_unit: 1790,
          quantity: 1
        }
      ],
      transaction: %Transaction{
        customer_ip: "127.0.0.1",
        url_notification: "http://barbaramilani.com/hooks/yapay"
      },
      payment: %Payment{
        payment_method_id: PaymentMethods.get_payment_method_by(name: :mastercard).id,
        card_name: "TONY STARK",
        card_number: "4012001037141112",
        card_expdate_month: 10,
        card_expdate_year: 2025,
        card_cvv: 123,
        split: 12
      }
    }
  end
end
