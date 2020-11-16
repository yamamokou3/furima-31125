class UserPurchasesController < ApplicationController
  def index
    @userpurchases = UserPurchase.new
  end

  def create
  end

end
