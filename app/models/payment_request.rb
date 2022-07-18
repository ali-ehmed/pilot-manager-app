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
  store_accessor :payment_payload, [:amount, :status, :currency, :description, :request_sent_at], prefix: :payment

  scope :latest, -> { order(created_at: :desc) }

  def approve!(approved = false)
    self.approved = approved
    self.approved_at = Time.now if approved?
    save!
    MessageBroker::ApprovePayments.publish(self)
  end
end
