require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    current_user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: current_user.id, item_id: @item)
    sleep 0.1
  end

  describe '購入者情報保存' do
    context '情報が登録できるとき' do
      it 'postal_code, municipality, street_number, telephone_number, user_id, purchase_id, tokenが存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '情報が登録できないとき' do
      it 'postal_codeが空だと登録できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'municipalityが空だと登録できない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_numberが空だと登録できない' do
        @purchase_address.street_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'telephone_numberが空だと登録できない' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁でなければ登録できない' do
        @purchase_address.postal_code = '11111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '携帯番号が10桁以上11桁以内でなければ登録できない' do
        @purchase_address.telephone_number = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '携帯番号が12桁以上では登録できない' do
        @purchase_address.telephone_number = '1111111111111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '携帯番号に半角数字以外が含まれている場合は登録できない' do
        @purchase_address.telephone_number = '111aaaa1111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空では登録できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'area_idが「----」では登録できない' do
        @purchase_address.area_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area must be other than 1")
      end
    end
  end
end
