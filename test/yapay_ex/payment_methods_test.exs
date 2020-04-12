defmodule YapayEx.PaymentMethodsTest do
  use ExUnit.Case

  alias YapayEx.PaymentMethod
  alias YapayEx.PaymentMethods

  describe "get_payment_method_by/1" do
    test "find payment method by its id" do
      assert %PaymentMethod{
               id: 3,
               name: :visa,
               max_parcels_number: 10,
               debit_option?: false
             } = PaymentMethods.get_payment_method_by(id: 3)
    end

    test "find payment method by its name" do
      assert %PaymentMethod{
               id: 25,
               name: :hiper,
               max_parcels_number: 10,
               debit_option?: false
             } = PaymentMethods.get_payment_method_by(name: :hiper)
    end

    test "returns nil when no payment method is found" do
      assert PaymentMethods.get_payment_method_by(name: :xpto) == nil
    end
  end
end
