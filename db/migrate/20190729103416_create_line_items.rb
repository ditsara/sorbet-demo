# typed: true
class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.string :narrative
      t.decimal :amount
      t.belongs_to :account, foreign_key: true
      t.belongs_to :transaction, foreign_key: true

      t.timestamps
    end
  end
end
