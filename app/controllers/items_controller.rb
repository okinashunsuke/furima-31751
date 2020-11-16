class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit,:destroy]
  
  
def index  
  @items = Item.order("created_at DESC")

end

def destroy
  if  @item.destroy
    redirect_to action: :index
  else
    render :show  
  end
end

def show
end

def edit
end

def update
  if @item.update(item_params)
    redirect_to action: :show
  else
    render :edit  
  end
end


def new 
  @item = Item.new 
end

def create
  @item = Item.new(item_params) 
  if @item.save
   redirect_to action: :index
  else
   render :new
  end
end


  private

  def item_params
   params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :postage_id, :prefecture_id, :handing_time_id ).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id]) 
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

 end
