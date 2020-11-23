class PurchasesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id]) 
  end


  def create
    @item = Item.find(params[:item_id]) 
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

end
