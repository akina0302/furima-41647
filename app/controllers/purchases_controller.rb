class PurchasesController < ApplicationController
  def index
    @purchases_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

end
