class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index 
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number, :price).merge(user_id: current_user.id, item_id: @item.id)
  end
end
