module PaymentRequestsHelper
  def display_amount(amount, currency)
    number_to_currency(amount, unit: PaymentRequest::CURRENCY_UNITS[currency])
  end
end
