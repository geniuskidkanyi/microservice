class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :customer_id
      t.decimal :input_amount
      t.string :input_currency
      t.decimal :output_amount
      t.string :output_currency

      t.timestamps
    end
  end
end
