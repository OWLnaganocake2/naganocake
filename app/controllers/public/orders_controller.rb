class Public::OrdersController < ApplicationController
    def index
        @orders = current_customer.orders
    end

    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end
    
    
    def new
        @order = Order.new
        @customer = current_customer
         sum = 0
         cart_items = current_customer.cart_items
        cart_items.each do |cart_item|
            sum += (cart_item.item.price * 1.1).floor * cart_item.amount
        end
        @total_price = sum
        @addresses = current_customer.addresses
    end

    def create
        @order = Order.new(order_params)

        @order.customer_id = current_customer.id
      if @order.save!
        flash[:notice] = "注文情報を作成しました！"
        CartItem.destroy_all
         redirect_to orders_thanks_path
      else
        flash[:notice] = "注文情報の作成に失敗しました！" 
        redirect_to new_order_path
      end



    def confirm

        @cart_items = current_customer.cart_items
        sum = 0
         cart_items = current_customer.cart_items
        cart_items.each do |cart_item|
            sum += (cart_item.item.price * 1.1).floor * cart_item.amount
        end
        @total_price = sum
        @shipping_fee = 800
      
        if params[:order][:payment_method] == "0"
            @payment_method = "クレジットカード"
        elsif params[:order][:payment_method] == "1"
            @payment_method = "銀行振込"
        end
        @order = Order.new(order_params) 
        
        destination = params[:order][:a_method].to_i
        
        if destination == 0


            @post_code = current_customer.post_code
            @address = current_customer.address
            @name = current_customer.family_name + current_customer.first_name

        # 登録済住所が選択された時
        elsif destination == 1

            address = Address.find(params[:address_for_order])
            @post_code = address.post_code
            @address = address.address
            @name = address.name

        # 新しいお届け先が選択された時
        elsif destination == 2
            @post_code = params[:order][:post_code]
            @address = params[:order][:address]
            @name = params[:order][:name]

        end

    end

    def thanks
        # order = Order.new(params[:order])
        # order.save

        # cart_items = current_customer.cart_items
        # cart_items.each do |cart_item|
        #     order_detail = OrderDetail.new
        #     order_detail.order_id = order_id
        #     order_detail.item_id = cart_item.item_id
        #     order_detail.amount = cart_item.amount
        #     order_detail.making_status = 0
        #     order_detail.price = cart_item.item.add_tax_sales_price
        #     order_detail.save
        # end
    end
    private
	def order_params
		params.require(:order).permit(:status,:total_price,:payment_method,:shipping_fee,:post_code,:address,:name,:customer_id)
	end

   
end
