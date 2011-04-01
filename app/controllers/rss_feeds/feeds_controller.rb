module RssFeeds
  class FeedsController < RssFeeds::BaseController
    defaults :resource_class => RssFeeds::Feed
    
    def create
      Feed.discover!(params[:url])
      render :json => true
    end
  end
end
