class Admin::PagesController < ApplicationController
  before_action :authenticate_admin!

  def home
    @order_pagenation = Order.page(params[:page]).per(10)
    @orders = Order.all
  end

end