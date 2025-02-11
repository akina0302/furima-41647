class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
   @purchase_address = PurchaseAddress.new(purchases_params)
   @item = Item.find(params[:item_id])
   if @purchase_address.valid?
    @purchase_address.save
    redirect_to root_path
   else
    puts @purchase_address.errors.full_messages
    render :index , status: :unprocessable_entity
   end
  end

  private

  def purchases_params
    params.require(:purchase_address).permit(:post_code,:prefecture_id,:cities,:housenumber,:build,:tel).merge(user_id: current_user.id,item_id: params[:item_id])
  end


end
