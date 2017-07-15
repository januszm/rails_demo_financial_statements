class CreateFinancialStatements < ActiveRecord::Migration[5.1]
  def change
    create_table :financial_statements do |t|
      t.string :symbol
      t.string :name
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
    add_index :financial_statements, :symbol
  end
end
