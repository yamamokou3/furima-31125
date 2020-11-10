require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '出品する商品の登録' do
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nicknameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categroy_idが選択されていないと登録できない' do
        @item.categroy_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Categroy can't be blank")
      end
      it 'status_idが選択されていないと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'burden_idが選択されていないと登録できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it 'area_idが選択されていないと登録できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'days_idが選択されていないと登録できない' do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満だと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9,999,999円超えると登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceは半角数字以外は登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
