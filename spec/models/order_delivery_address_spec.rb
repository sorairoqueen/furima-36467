require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  describe '購入情報・配送先住所の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id, image: fixture_file_upload('app/assets/images/rspec_test.jpeg'))
      sleep 0.1
      @OrderDeliveryAddress = FactoryBot.build(:order_delivery_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@OrderDeliveryAddress).to be_valid
      end
      it 'orderer_phone_numは10桁でも保存できること' do
        @OrderDeliveryAddress.orderer_phone_num { '0157012345' }
        expect(@OrderDeliveryAddress).to be_valid
      end
      it 'delivery_buildingは空でも保存できること' do
        @OrderDeliveryAddress.delivery_building = ''
        expect(@OrderDeliveryAddress).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'delivery_postalcodeが空だと保存できないこと' do
        @OrderDeliveryAddress.delivery_postalcode = ''
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Delivery postalcode can't be blank")
      end
      it 'delivery_postalcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @OrderDeliveryAddress.delivery_postalcode = '1234567'
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include('Delivery postalcode is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @OrderDeliveryAddress.prefecture_id = ''
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_cityが空だと保存できないこと' do
        @OrderDeliveryAddress.delivery_city = ''
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Delivery city can't be blank")
      end
      it 'delivery_blockが空だと保存できないこと' do
        @OrderDeliveryAddress.delivery_block = ''
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Delivery block can't be blank")
      end
      it 'orderer_phone_numが空だと保存できないこと' do
        @OrderDeliveryAddress.orderer_phone_num = ''
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Orderer phone num can't be blank")
      end
      it 'orderer_phone_numが全角の数字だと保存できないこと' do
        @OrderDeliveryAddress.orderer_phone_num = '０９０１２３４５６７８'
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Orderer phone num is invalid")
      end
      it 'orderer_phone_numが数字以外の半角文字だと保存できないこと' do
        @OrderDeliveryAddress.orderer_phone_num = '090abcd5&78'
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Orderer phone num is invalid")
      end
      it 'orderer_phone_numが10桁より小さい桁数だと保存できないこと' do
        @OrderDeliveryAddress.orderer_phone_num = '090123456'
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Orderer phone num is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @OrderDeliveryAddress.user_id = nil
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @OrderDeliveryAddress.item_id = nil
        @OrderDeliveryAddress.valid?
        expect(@OrderDeliveryAddress.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
