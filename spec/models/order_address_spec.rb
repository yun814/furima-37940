require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    buyer = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: buyer.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品を購入できる場合' do
      it 'token, postal_code, prefecture_id, municipality, address, telephone_number, buildingが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'tokenが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-が含まれていないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが全角数字だと購入できない' do
        @order_address.postal_code = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが英字だと購入できない' do
        @order_address.postal_code = 'abc-defg'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが全角文字だと購入できない' do
        @order_address.postal_code = '一二三-四五六七'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと購入できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下だと購入できない' do
        @order_address.telephone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is too short")
      end
      it 'telephone_numberに-が含まれていると購入できない' do
        @order_address.telephone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end
      it 'telephone_numberが全角数字だと購入できない' do
        @order_address.telephone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end
      it 'telephone_numberが英字だと購入できない' do
        @order_address.telephone_number = 'abcdefghijk'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end
      it 'telephone_numberが全角文字だと購入できない' do
        @order_address.telephone_number = '一ニ三四五六七八九十'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end
      it 'userに紐付いていないと購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemに紐付いていないと購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
