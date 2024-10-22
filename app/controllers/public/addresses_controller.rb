class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "登録しました。"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      flash.now[:alert] = '配送先の登録に失敗しました。'
      render 'index'
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :post_code, :address)
  end
end
