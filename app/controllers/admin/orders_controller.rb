class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if Order.statuses[@order.status] == 1
      @order_details = @order.order_details
      @order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :billing_amount, :payment_method, :status)
  end

end
