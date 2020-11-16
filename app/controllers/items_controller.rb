class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :move_to_index, only: [:edit]
def index  
  @items = Item.order("created_at DESC")

end

# def destroy
#   @item = Item.all
#   @item.destroy
# end

def show
  @item = Item.find(params[:id]) 
end

def edit
  @item = Item.find(params[:id]) 
end

def update
  @item = Item.find(params[:id]) 
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
  
  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end




 end
