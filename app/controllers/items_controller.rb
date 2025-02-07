class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :item, only:[:show,:edit,:update,:destroy]

  def index
    @items=Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
     redirect_to item_path
    else
     render :edit,status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    end
  end

  private 

  def item_params
    params.require(:item).permit(:image,:item_name,:description,:category_id,:condition_id,:payment_id,:prefecture_id,:derivery_day_id,:price).merge(user_id: current_user.id)
  end

  def item
    @item = Item.find(params[:id])
  end

end
