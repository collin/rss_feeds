Dummy::Application.routes.draw do
  mount RssFeeds::Engine => "/rss_feeds"
end
