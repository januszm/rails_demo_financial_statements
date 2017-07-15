require 'open-uri'

class ScrapeYahooJob < ApplicationJob
  queue_as :default

  def perform(symbol)
    url = "https://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.quotes where symbol = '#{symbol}'&format=json&env=store://datatables.org/alltableswithkeys"
    json = JSON.parse(open(URI.parse(url)).read)
    ask = json["query"].fetch("results", {}).fetch("quote", {}).fetch("Ask", 0)
    FinancialStatement.create(price: ask, company: Company.find_by(symbol: symbol))
  end

end
