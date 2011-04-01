module RssFeeds
  class EntryJobs < BaseJob
    def fetch(meta, feed)
      feed.fetch_entries
      feed.raw_entries.each do |raw_entry|
        EntryJobs.process(feed, raw_entry)
      end
    end
    
    def process(meta, feed, raw_entry)
      entry = Google::Ajax::Feed::Entry.new raw_entry
      feed.entries.create!\
         :link => entry.link,
         :title => entry.title,
         :content => entry.content,
         :author => entry.author,
         :created_at => entry.created_at
    end
  end
end
