class CreatePaymentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_requests, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.uuid :payment_id
      t.datetime :approved_at
      t.text :rejected_reason
      t.jsonb :payment_payload, null: false, default: '{}'

      t.timestamps
    end
  end
end
