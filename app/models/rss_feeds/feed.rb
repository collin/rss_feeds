module RssFeeds
  class Feed
    include Mongoid::Document
    include Mongoid::Timestamps
    
    references_many :entries, :class_name => "RssFeeds::Entry"
    references_many :subscriptions, :class_name => "RssFeeds::Subscription"
    
    field :canonical_id, :type => String
    field :title, :type => String
    field :description, :type => String
    field :author, :type => String
    field :link, :type => String
    
    index :canonical_id, :unique => true
    
    validates_presence_of :canonical_id, :title, :description, :author, :link
    
    def self.discover!(feed_url)
      feed = ::Google::Ajax::Feed.lookup(feed_url)
      
      find(:canonical_id => feed.canonical_id) || create!(
        :canonical_id => feed.canonical_id,
        :title => feed.title,
        :describption => feed.description,
        :author => feed.author,
        :link => feed.link
      )
    end
    
    def encode_json(*)
      {
        :canonical_id => canonical_id,
        :title => title,
        :description => description,
        :author => author,
        :link => link
      }
    end
    
    def notify_subscribers event, data
      subscriptions.each do |subscription|
        subscription.notify_subscriber event, data
      end
    end
  end
end
