class Transaction < ApplicationRecord
  belongs_to :user
  validates :customer_id, :input_amount, :input_currency, :output_amount, :output_currency, presence: true
end
