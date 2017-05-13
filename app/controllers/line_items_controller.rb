class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    if !current_user.current_cart
      current_user.current_cart = Cart.create(user_id: current_user.id)
    end
    @cart = current_user.current_cart
    #@cart.add_item(params[:item_id])
    #@cart.save
    if @cart.line_items.find_by(item_id:params[:item_id])
      existing_item = @cart.line_items.find_by(item_id:params[:item_id])
      existing_item.quantity += 1
      existing_item.save
    else
      LineItem.create(item_id: params[:item_id], cart_id:@cart.id)
    end

    current_user.save
    redirect_to cart_path(@cart)
  end

end
