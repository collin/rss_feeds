module RssFeeds
  class SubscriptionJobs < BaseJob
    def subscribe(feed_url, subscriber)
      feed = RssFeeds::Feed.discover!(feed_url)
    
      RssFeeds::Subscription.create!\
        :feed => feed,
        :subscriber => subscriber
    end
  
    def unsubscribe(feed_url, subscriber)
      feed = RssFeeds::Feed.discover(feed_url)
    
      RssFeeds::Subscription.where(
        :feed => feed,
        :subscriber_type => subscriber_type
        :subscriber_id => subscriber_id
      ).destroy_all
    end
  end
end