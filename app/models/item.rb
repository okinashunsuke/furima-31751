class Item < ApplicationRecord
  
  with_options presence: true ,numericality: { other_than: 1 }do  
   validates :category_id     
   validates :condition_id    
   validates :postage_id      
   validates :prefecture_id   
   validates :handing_time_id 
  end

  with_options presence: true do
   validates :image
   validates :name        
   validates :description 
   validates :price       ,inclusion: {in: 300..9999999  }
  end

  has_one    :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :handing_time
end