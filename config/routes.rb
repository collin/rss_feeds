Rails.application.routes.draw do
  namespace :rss_feeds do
    resources :entries
    resources :feeds
    resources :subscriptions    
  end
end