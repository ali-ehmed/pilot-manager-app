module PaymentRequestsHelper
  def display_amount(amount, currency)
    number_to_currency(amount, unit: PaymentRequest::CURRENCY_UNITS[currency])
  end

  def display_approve_label(approved)
    return if approved.nil?

    if approved
      content_tag(:span, "Approved", class: "badge text-green-500 text-sm")
    else
      content_tag(:span, "Rejected", class: "badge text-red-500 text-sm")
    end
  end
end
