json.extract! transaction, :id, :user_id, :customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
