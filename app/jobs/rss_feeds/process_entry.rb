module RssFeeds::ProcessEntry
  @queue = "rss_feeds/process_entry"
  
  def perform feed_id, raw_entry
    feed = RssFeeds::Feed.find(feed_id)
    entry = Google::Ajax::Feed::Entry.new raw_entry
    feed.entries.create!\
       :link => entry.link,
       :title => entry.title,
       :content => entry.content,
       :author => entry.author,
       :created_at => entry.created_at
  end
end