class Public::ItemsController < ApplicationController
  def index
    @items_all = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
  end
end
