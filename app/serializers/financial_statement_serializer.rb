class FinancialStatementSerializer < ActiveModel::Serializer
  attributes :id, :symbol, :name, :price
end
