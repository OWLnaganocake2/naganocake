class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  en
end
