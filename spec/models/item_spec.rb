require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
    @user.save
    @item.user_id = @user.id
  end
  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '必須項目が入力され、販売価格が300円以上なら登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '必須項目が入力され、販売価格が9,999,999円以下なら登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角整数以外（小数点）では登録できない' do
        @item.price = '66.6667'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it 'priceが半角整数以外（全角数字）では登録できない' do
        @item.price = '４４４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角整数以外（全角文字）では登録できない' do
        @item.price = 'ポケモン'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10,000,000円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'item categoryが空では登録できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item categoryが未選択では登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item statusが空では登録できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'item statusが未選択では登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'fee respが空では登録できない' do
        @item.fee_resp_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee resp can't be blank")
      end
      it 'fee respが未選択では登録できない' do
        @item.fee_resp_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee resp can't be blank")
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが未選択では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery termが空では登録できない' do
        @item.delivery_term_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery term can't be blank")
      end
      it 'delivery termが未選択では登録できない' do
        @item.delivery_term_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery term can't be blank")
      end

      it 'userが空では登録できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
