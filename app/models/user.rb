class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :nickname, presence: true, length: { maximum: 40 }
  validates :birthday, presence: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}do
    validates :first_name
    validates :last_name
  end
  
  
  
  with_options presence: true, format: { with: /\A[ァ-ヶ]/}do
    validates :first_name_kana
    validates :last_name_kana
  end



  has_many :items 
  has_many :purchases

end