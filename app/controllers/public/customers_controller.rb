class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end


 private
  def customer_params
    params.require(:customer).permit(:address, :postal_code, :telephone_number, :email)
  end
end
