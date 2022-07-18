FactoryBot.define do
  factory :payment_request do
    payment_id { Faker::Internet.uuid }
    payment_payload do
      {
        initial_status: 'draft',
        amount: Faker::Number.between(from: 300, to: 5000),
        currency: 'cad',
      }
    end
  end
end