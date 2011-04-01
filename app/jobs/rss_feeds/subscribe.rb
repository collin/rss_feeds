module RssFeeds::Subscribe
  @queue = "rss_feeds/subscribe"
  
  def self.perform(feed_url, subscriber_type, subscriber_id)
    feed = RssFeeds::Feed.discover!(feed_url)
    subscriber = subscriber_type.constantize.find(subscriber_id)
    
    RssFeeds::Subscription.create!\
      :feed => feed,
      :subscriber => subscriber
  end
end