Rails.application.routes.draw do
  resources :financial_statements do
    collection do
      post "scrape"
    end
  end

  root to: 'financial_statements#index'
end
