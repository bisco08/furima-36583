require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報投稿' do
    context '出品情報が投稿できるとき' do
      it 'item_name, content, category_id condition_id, shipping_charge_id, area_id, shipping_date_id, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'item_nameが40文字以内だと投稿できる' do
        expect(@item).to be_valid
      end
      it 'contentが1000文字以内だと投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報が投稿できないとき' do
      it 'item_nameが空では投稿できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'contentが空では投稿できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが空では投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idが空では投稿できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'shipping_charge_idが空では投稿できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it 'area_idが空では投稿できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'shipping_date_idが空では投稿できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it 'priceが空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数値では投稿できない' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが半角英数字混合では投稿できない' do
        @item.price = 'furima111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英語では投稿できない' do
        @item.price = 'furimadesu'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが￥300~￥9,999,999以外では投稿できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが￥10.000.000以上では投稿できない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it 'userが紐付いていないと投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'imageが空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
