require "rails"

module RssFeeds
  autoload :Engine, "rss_feeds/engine"
  
  def self.app_path
    @app_path ||= Pathname.new(__FILE__).dirname.expand_path.join("../app")
  end
  
  def self.decorate(path)
    path = app_path.join(path).to_s
    if Rails.configuration.cache_classes
      ::Kernel.require path
    else
      ::Kernel.load path
    end
  end
  
  # if defined?(Barista::Framework)
  #   Barista::Framework.register \
  #     :name => 'rss_feeds_engine',
  #     :root => app_path.join("client").to_s
  # end
end
