class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to admin_item_path
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_genres_path(item.id)
  end

   private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end
end
