class Public::ItemsController < ApplicationController
  def index
    @items_all = Item.all
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

      private

  def item_params
    params.require(:item).permit(:name,:genre_id,:item_image, :item_details, :price, :is_active)
  end

end
