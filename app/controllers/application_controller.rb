class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def reset
    Item.delete_all
    Merchant.delete_all
    Purchaser.delete_all
    Purchase.delete_all
    redirect_to '/'
  end
end
