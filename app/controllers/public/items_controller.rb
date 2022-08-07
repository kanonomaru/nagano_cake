class Public::ItemsController < ApplicationController
  def index
    @admin_genres_index = Genre.all
    @item = Item.all
  end
end
