module RssFeeds::FetchEntries
  @queue = "rss_feeds/fetch_entries"
  
  def self.perform(feed_id)
    entries = RssFeeds::Feed.find(feed_id).fetch_entries
    
    raw_entries.each do |raw_entry|
      Resque.enqueue RssFeeds::ProcessEntry, feed_id, raw_entry
    end
  end
end