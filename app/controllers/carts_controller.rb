class CartsController < ApplicationController
  def show
    @checked_out = false
  end

  def checkout
    @cart = Cart.find(params[:id])
    @checked_out = true
    @cart.line_items.each do |line_item|
      line_item.item.inventory = line_item.item.inventory - line_item.quantity
    end
    @cart.save
    redirect_to cart_path(@cart)
  end
end
