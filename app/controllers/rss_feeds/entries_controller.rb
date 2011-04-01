module RssFeeds
  class EntriesController < RssFeeds::BaseController
    defaults :resource_class => RssFeeds::Entry
  end
end
