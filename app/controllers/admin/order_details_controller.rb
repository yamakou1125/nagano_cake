class Admin::OrderDetailsController < ApplicationController

before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    if @order_detail.making_status == "making"
       @order.update(status: 2)
    elsif @order.order_details.pluck(:making_status).all? {|making_status| making_status == "complete"}
       @order = @order_detail.order
       @order.update(status: 3)
    end
     redirect_to admin_order_path(@order_detail.order.id)
  end

private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :making_status)
  end


end
