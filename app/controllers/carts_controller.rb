class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout!

    redirect_to cart_path(@cart)
    current_user.current_cart = nil
    current_user.save
  end
end
