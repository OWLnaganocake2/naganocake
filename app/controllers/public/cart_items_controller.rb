class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!

    def index
        @cart_items = current_customer.cart_items.all
    end

    def create
        @cart_item = current_customer.cart_items.new(cart_item_params)
      if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
                          #元々カート内にあるもの「item_id」
                          #今追加したparams[:cart_item][:item_id])
        cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i#cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える#.to_iとして数字として扱う
        cart_item.save
        redirect_to cart_items_path
        # もしカート内に「同じ」商品がない場合は通常の保存処理
      elsif @cart_item.save
        @cart_items = current_customer.cart_items.all
        render 'index'
      else # 保存できなかった場合
        flash[:notice] = "カートの保存に失敗しました"
        render 'index'
      end
    end

    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        @cart_items = CartItem.all
        render 'index'
    end

    def destroy_all
        CartItem.destroy_all
        current_customer.cart_items.destroy_all
        redirect_to cart_items_path, notice: 'カートが空になりました。'
    end

    def update
        @cart_item = CartItem.find(params[:id])
       if @cart_item.update(cart_item_params)
         redirect_to cart_items_path
         flash[:notice] = "カートを更新しました！"
       else
        flash[:notice] = "カートの更新に失敗しました！"
        redirect_to cart_items_path(@cart_item)
       end
    end



private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :price, :amount)
    end
end
