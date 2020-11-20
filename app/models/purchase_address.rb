class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name,:phone_number,:purchase_id,:item_id,:user_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id ,numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/}
    validates :item_id
    validates :user_id
  end

  def save
   purchase = Purchase.create(item_id: item_id , user_id: user_id)
    # 住所の情報を保存
   address = Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,phone_number: phone_number,purchase_id: purchase.id)
    
  end

end

