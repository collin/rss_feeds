class RssFeeds.Feed extends Backbone.Model

  constructor: () ->
    super
    @entries = new RssFeeds.Entries @get "entries"
  