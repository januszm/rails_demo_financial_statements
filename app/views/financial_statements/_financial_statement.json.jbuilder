json.extract! financial_statement, :id, :symbol, :name, :price
json.url financial_statement_url(financial_statement, format: :json)
