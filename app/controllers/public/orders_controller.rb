class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @sum = 0
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @customer = current_customer
    @cart_items = @customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.subtotal
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :billing_amount, :payment_method, :status)
  end

end
