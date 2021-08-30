class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_date
  belongs_to :area

  validates :item_name, presence: true
  validates :content,   presence: true
  validates :price, presence: true, inclusion: { in: (300..9_999_999)}, format: { with: /\A[0-9]+\z/ }
  

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :area_id
    validates :shipping_date_id
  
  end
  
end
