class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice]= "登録情報を変更しました。"
      redirect_to customers_my_page_path
    else
      render 'edit'
    end
  end

  def unsubscrive
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session

    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
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
                                     :email,
                                     :is_active
                                     )
  end
end
