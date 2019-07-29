class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :code
      t.integer :account_type
      t.boolean :archived

      t.timestamps
    end
  end
end
