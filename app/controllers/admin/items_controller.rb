class Admin::ItemsController < ApplicationController
  
  def index
    @items_all = Item.all
    @items =Item.page(params[:page]).per(10)
  end
end
