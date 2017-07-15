class MoveSymbolToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :symbol, :string
    remove_column :financial_statements, :symbol
  end
end
