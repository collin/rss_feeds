module RssFeeds
  class Subscription
    include Mongoid::Document
    include Mongoid::Timestamps
  
    referenced_in :feed, :class_name => "RssFeeds::Feed"
    referenced_in :subscriber, 
      :inverse_of => :subscriptions,
      :polymorphic => true

    validates_presence_of :feed, :subscriber
    
    after_create :notify_subscriber_after_create
    
    def notify_subscriber_after_create
      notify_subscriber("/subscriptions/create", to_json)
    end

    def notify_subscriber(event, data)
      return unless receives_notifications?
      private_channel.trigger(event, data)
    end

    def private_channel
      return unless receives_notifications?
      subscriber.private_channel
    end

    def receives_notifications?
      subscriber.respond_to?(:private_channel)
    end
  end
end
