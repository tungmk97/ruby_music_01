class StaticPagesController < ApplicationController
  def home
    @feed_items = Song.hot_feed
                      .page(params[:id]).per Settings.pages.feed
  end
end
