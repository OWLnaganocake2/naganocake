class Public::ItemsController < ApplicationController
  def index
    @items_all = Item.all
    @items = Item.page(params[:page]).per(8)
    @item
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
