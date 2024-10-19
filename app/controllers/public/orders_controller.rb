class Public::OrdersController < ApplicationController
    def index
        # @orders = current_customer.orders
        @orders = Order.all #新規顧客登録完了後変数変更
    end

    def show
        @order = Order.find(params[:id])
    end
end
