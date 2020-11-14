class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,]

def index  
  @items = Item.all.order("created_at DESC")

end

def destroy
  @item = Item.all
  @item.destroy
end

def show
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
  
 end
