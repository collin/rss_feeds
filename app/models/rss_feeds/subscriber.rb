module RssFeeds::Subscriber
  extend ActiveSupport::Concern
  
  included do
    references_many :subscriptions, 
      :class_name => "RssFeeds::Subscription",
      :inverse_of => :subscriber
  end

  def private_channel
    raise "Implement method #{self.class.name}#private_channel"
  end
  
  def private_channel_active?
    raise "Implement method #{self.class.name}#private_channel_active?"
  end

  def subscriptions
    RssFeeds::Subscription.where(:subscriber_id => id)
  end
end
