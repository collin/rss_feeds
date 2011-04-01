module RssFeeds::Unsubscribe
  @queue = "rss_feeds/unsubscribe"
  
  def self.perform(feed_url, subscriber_type, subscriber_id)
    feed = RssFeeds::Feed.discover(feed_url)
    
    RssFeeds::Subscription.where(
      :feed => feed,
      :subscriber_type => subscriber_type
      :subscriber_id => subscriber_id
    ).destroy_all
  end
end