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
    
       private
    
    def customer_params
    params.require(:customer).permit(:family_name,:first_name,
                                     :family_name_kana,:first_name_kana,
                                     :post_code,:address,
                                     :tell_number,:email,:is_active
                                     )
  end
end
