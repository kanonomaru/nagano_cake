class Public::HomesController < ApplicationController
  def top
    @genres_index = Genre.all
  end

  def about
  end
end
