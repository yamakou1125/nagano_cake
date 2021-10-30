class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :billing_amount, :payment_method, :status)
  end

end
