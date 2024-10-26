class Admin::CustomersController < ApplicationController

    def index
      @customers_all = Customer.all
      @customers = Customer.page(params[:page]).per(10)
    end

    def show
      @customer = Customer.find(params[:id])
    end

    def edit
      @customer = Customer.find(params[:id])
    end

    def destroy
      customer = Customer.find(params[:id])
      customer.destroy
      redirect_to admin_genres_path
    end

    def update
      @customer = Customer.find(params[:id])
       if @customer.update(customer_params)
        redirect_to admin_customer_path(@customer)
        flash[:notice] = "商品情報を更新しました！"
       else
        flash[:notice] = "商品情報の更新に失敗しました！"
        render :edit
       end
    end

       private

    def customer_params
    params.require(:customer).permit(:family_name,:first_name,
                                     :family_name_kana,:first_name_kana,
                                     :post_code,:address,
                                     :tell_number,:email,:is_deleted
                                     )
    end
end
