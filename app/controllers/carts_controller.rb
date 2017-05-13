class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |line_item|
      line_item.item.inventory = line_item.item.inventory - line_item.quantity
      line_item.item.save
    end
    @cart.update(status: 'submitted')

    redirect_to cart_path(@cart)
    current_user.current_cart = nil
    current_user.save
  end
end
