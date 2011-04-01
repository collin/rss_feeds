module RssFeeds
  class SubscriptonsController < RssFeeds::BaseController
    defaults :resource_class => RssFeeds::Subscription
  end  
end
