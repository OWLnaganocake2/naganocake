class Public::CustomersController < ApplicationController
  def show
    @customer = current.customer
  end

  def edit
  end
end
