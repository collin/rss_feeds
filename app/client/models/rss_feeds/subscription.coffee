class RssFeeds.Subscription extends Backbone.Model

  constructor: () ->
    super
    @feeds = new RssFeeds.Feeds @get "feeds"
  