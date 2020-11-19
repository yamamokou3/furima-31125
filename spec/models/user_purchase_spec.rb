require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe "購入記録と配送先住所の保存" do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  it '全ての情報が登録できること' do
    expect(@user_purchase).to be_valid
  end
  it 'tokenが空だと登録できない' do
    @user_purchase.token = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
  end
  it 'zip_cpdeが空だと登録できない' do
    @user_purchase.zip_cpde = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Zip cpde can't be blank")
  end
  it 'zip_cpdeに半角のハイフンがなければ登録できない' do
    @user_purchase.zip_cpde = '1234567'
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Zip cpde is invalid. Include hyphen(-)")
  end
  it 'area_idが1だと登録できない' do
    @user_purchase.area_id = 1
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Area must be other than 1")
  end
  it 'municipalityが空だと登録できない' do
    @user_purchase.municipality = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Municipality can't be blank")
  end
  it 'municipalityが全角の日本語でない場合登録できない' do
    @user_purchase.municipality = 'yokohamasikanazawa'
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Municipality is invalid. Input full-width characters.")
  end
  it 'addressが空だと登録できない' do
    @user_purchase.address = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
  end
  it 'phone_numberが空だと登録できない' do
    @user_purchase.phone_number = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
  end
  it 'phone_numberが全角数字だと登録できない' do
    @user_purchase.phone_number = '１２３４５６７８９０１'
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number Input only number.")
  end
  it 'phone_numberが11桁でないと登録できない' do
    @user_purchase.phone_number = 1234567890
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number Input only number.")
  end
end
end
