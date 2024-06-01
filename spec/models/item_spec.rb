require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を出品できる場合' do
      it '各項目が適切に存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10,000,000以上では出品できない' do
        @item.price =  '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが数字以外だと出品できない' do
        @item.price = 'ひゃくまんえん'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'shipping_fee_burden_idが空では出品できない' do
        @item.shipping_fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden is not a number")
      end
      it 'shipping_fee_burden_idが1では出品できない' do
        @item.shipping_fee_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end


      it 'shipping_day_idが空では出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is not a number")
      end
      it 'shipping_day_idが1では出品できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
