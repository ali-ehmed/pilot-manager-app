class PaymentRequest < ApplicationRecord
  CURRENCIES = [
    USD = "usd",
    CAD = "cad",
    EUR = "eur",
  ].freeze

  CURRENCY_UNITS = {
    USD => '$',
    CAD => '$',
    EUR => '€',
  }.freeze

  serialize :payment_payload, HashSerializer
  store_accessor :payment_payload, [:amount, :status, :currency, :description], prefix: :payment

  scope :recently_approved, -> { order(approved_at: :desc) }
end
