class AddCompanyIdToFinancialStatement < ActiveRecord::Migration[5.1]
  def change
    add_column :financial_statements, :company_id, :integer
  end
end
