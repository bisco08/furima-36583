class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :street_number, :building_name, :telephone_number, :user_id, :item_id, :purchase_id, :token

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/ 
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :area_id, numericality: { other_than: 1 }
  validates :municipality, presence: true
  validates :street_number, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, street_number: street_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end