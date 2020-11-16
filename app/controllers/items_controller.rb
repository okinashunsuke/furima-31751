class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

def index  
  @items = Item.order("created_at DESC")

end

# def destroy
#   @item = Item.all
#   @item.destroy
# end

def show
  @item = Item.find(params[:id]) 
  @name = @item.name
  @description = @item.description
  @price = @item.price
  @category = @item.category[:name]
  @condition = @item.condition[:name]
  @postage = @item.postage[:name]
  @prefecture = @item.prefecture[:name]
  @handing_time  = @item.handing_time[:name]
  @image = @item.image
  
  user_id = @item.user_id
  @user = User.find(user_id)
  @nickname = @user.nickname
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
