class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @customer = current_customer
        # @addresses = Address.where(customer_id: current_customer.id)
    end

    def create
        customer = current_customer

        session[:order] = Order.new

        cart_items = current_customer.cart_items

        sum = 0
        cart_items.each do |cart_item|
            sum += (cart_item.item.price * 1.1).floor * cart_item.amount
        end

        session[:order][:shipping_fee] = 800
        session[:order][:total_price] = sum + session[:order][:shipping_fee]
        session[:order][:status] = 0
        session[:order][:customer_id] = current_customer.id
        # ラジオボタンで選択された支払方法のenum番号を渡している
		session[:order][:payment_method] = params[:payment_method].to_i

        # ラジオボタンで選択されたお届け先によって条件分岐
        destination = params[:a_method].to_i

        # ご自身の住所が選択された時
        if destination == 0

            session[:order][:post_code] = customer.post_code
            session[:order][:address] = customer.address
            session[:order][:name] = customer.family_name + customer.first_name

        # 登録済住所が選択された時
        elsif destination == 1

            address = Address.find(params[:address_for_order])
            session[:order][:post_code] = address.post_code
            session[:order][:address] = address.address
            session[:order][:name] = address.name

        # 新しいお届け先が選択された時
        elsif destination == 2

            session[:new_address] = 2
            session[:order][:post_code] = params[:post_code]
            session[:order][:address] = params[:address]
            session[:order][:name] = params[:name]

        end

        # お届け先情報に漏れがあればリダイレクト
        if session[:order][:post_code].presence && session[:order][:address].presence && session[:order][:name].presence
            redirect_to
        else
            redirect_to new_order_path
        end
    end

    def confirm
        @cart_items = current_customer.cart_items
    end

    def thanks
        order = Order.new(session[:order])
        order.save

        if session[:new_address]
            address = current_customer.addresses.new
            address.post_code = order.post_code
            address.address = order.address
            address.name = order.name
            address.save
            session[:new_address] = nil
        end

        cart_items = current_customer.cart_items
        cart_items.each do |cart_item|
            order_detail = OrderDetail.new
            order_detail.order_id = order_id
            order_detail.item_id = cart_item.item_id
            order_detail.amount = cart_item.amount
            order_detail.making_status = 0
            order_detail.price = cart_item.item.add_tax_sales_price
            order_detail.save
        end


    end

    def index
        @orders = current_customer.orders
    end

    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end
end
