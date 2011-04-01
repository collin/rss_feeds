module RssFeeds
  class Entry
    include Mongoid::Document
    
    referenced_in :feed, :class_name => "RssFeeds::Feed"
    
    field :link, :type => String
    field :title, :type => String
    field :content, :type => String
    field :author, :type => Array
    field :created_at, :type => Time
    
    index :link, :index => true
    index :created_at
    
    validates_presence_of :feed

    after_create :notify_subscribers
    
    def notify_subscribers
      feed.notify_subscribers "entry:create", to_json
    end
    
    # TODO: sanitize HTML content
    # TODO: extract and categorize media content
    # TODO: pass content through semantic data engine
  end
end
