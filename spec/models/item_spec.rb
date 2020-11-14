require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全て入力していれば保存できること' do
    expect(@item). to be_valid
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Image can't be blank")
    end

    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Name can't be blank")
    end

    it 'descriptionが空では保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Description can't be blank")
    end

    it 'categoryが空では保存できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Category can't be blank", "Category is not a number")
    end

    it 'conditionが空では保存できないこと' do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Condition can't be blank", "Condition is not a number")
    end

    it 'postageが空では保存できないこと' do
      @item.postage = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Postage can't be blank", "Postage is not a number")
    end

    it 'prefectureが空では保存できないこと' do
      @item.prefecture = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it 'handing_timeが空では保存できないこと' do
      @item.handing_time = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Handing time can't be blank", "Handing time is not a number")
    end

    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages) .to include("Price is not included in the list")
    end

    it 'price￥300〜￥9999999以外では保存できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages) .to include("Price is not included in the list")
    end

    it 'priceが半角数字以外では保存できないこと' do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages) .to include("Price is not included in the list")
    end

  end
end