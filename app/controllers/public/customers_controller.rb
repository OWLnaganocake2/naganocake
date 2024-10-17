class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_my_page_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:family_name,
                                     :first_name,
                                     :family_name_kana,
                                     :first_name_kana,
                                     :post_code,
                                     :address,
                                     :tell_number,
                                     :email
                                     )
  end
end
