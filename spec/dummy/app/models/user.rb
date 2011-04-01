class User
  include Mongoid::Document
  include RssFeeds::Subscription::Subscriber
end
