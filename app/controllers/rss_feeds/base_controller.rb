module RssFeeds
  class BaseController < ApplicationController
    inherit_resources
    respond_to :json
  end
end