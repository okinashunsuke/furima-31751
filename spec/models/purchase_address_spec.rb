require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @purchase_address.token  = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが空だと保存できないこと' do
      @purchase_address.post_code  = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにはハイフンが含まれていなければ保存できないこと' do
      @purchase_address.post_code  = "1111111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンが含まれていると保存できないこと' do
      @purchase_address.phone_number = "-"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが11桁以上では保存できないこと' do
      @purchase_address.phone_number = 123456789012
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end