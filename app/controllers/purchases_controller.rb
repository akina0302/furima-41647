class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
    redirect_to root_path
    else
    @purchase_address = PurchaseAddress.new
    end

  end

  def create
   @purchase_address = PurchaseAddress.new(purchases_params)
   @item = Item.find(params[:item_id])
   if @purchase_address.valid?
    pay_item
    @purchase_address.save
    redirect_to root_path
   else
    puts @purchase_address.errors.full_messages
    render :index , status: :unprocessable_entity
   end
  end

  private

  def purchases_params
    params.require(:purchase_address).permit(:post_code,:prefecture_id,:cities,:housenumber,:build,:tel).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]#PAY.JPテスト秘密鍵
    Payjp::Charge.create(
        amount: @item.price,#商品の値段
        card: purchases_params[:token],
        currency: 'jpy'  #通貨の種類(日本円)
      )
  end
end
