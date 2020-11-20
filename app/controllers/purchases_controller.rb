class PurchasesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id]) 
  end


  def create
    @item = Item.find(params[:item_id]) 
    @purchase_address = PurchaseAddress.new(purchase_params)   #「UserDonation」に編集
     if @purchase_address.valid?
      @purchase_address.save
        redirect_to root_path
      else
        render action: :index
      end
  end  

  private
  # 全てのストロングパラメーターを1つに統合
 def purchase_params
  params.permit(:post_code,:prefecture_id, :city, :house_number, :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
 end

end
