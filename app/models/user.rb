class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'には全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'には全角カタカナを使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end 
  
end
