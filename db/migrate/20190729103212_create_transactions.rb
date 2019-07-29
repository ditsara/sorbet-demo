# typed: true
class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :narrative
      t.integer :status

      t.timestamps
    end
  end
end
