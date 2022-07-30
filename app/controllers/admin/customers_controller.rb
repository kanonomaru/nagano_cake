class Admin::CustomersController < ApplicationController
    def index
        @customer = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
        @customer = Customer.find(params[:id])
    end

  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id
    @customer.save
    redirect_to admin_customer_path
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end

    private
  def customer_params
    params.require(:customer).permit(:email, :is_active)
  end
end
