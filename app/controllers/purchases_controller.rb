class PurchasesController < ApplicationController

  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_top, only: [:index,:create]

  def index
    @purchase_address = PurchaseAddress.new(purchase_params)
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)   #「UserDonation」に編集
     if @purchase_address.valid?
      pay_item
      @purchase_address.save
        redirect_to root_path
      else
        render action: :index
      end
  end  

  private
  # 全てのストロングパラメーターを1つに統合
 def purchase_params
  params.permit(:post_code,:prefecture_id, :city, :house_number, :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: purchase_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
 end

 def set_item
  @item = Item.find(params[:item_id]) 
 end

 def move_to_top
  unless user_signed_in? && current_user.id != @item.user_id && @item.purchase == nil 
    redirect_to root_path
  end
 end 

end
