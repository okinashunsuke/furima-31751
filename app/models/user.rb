class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
 
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ]/}    
  validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶ]/}  
  validates :birthday, presence: true

  has_many :items 
  has_many :purchases

end



 # # VALID_PASSWORD_REGEX = /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/
  # validates :password, format: { with: /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6}$/ }

  # { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/}   