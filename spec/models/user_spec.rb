require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)    
  end
  describe 'ユーザー新規登録' do
    it 'emailが空では登録できない' do
      @user.email =  ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに@が含まれていない場合登録できない' do
      @user.email = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password =  ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password =  'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは数字混合でない場合、登録できない' do
      @user.password = 'ABCDEF'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordは英字混合でない場合、登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordは半角でない場合、登録できない' do
      @user.password = 'ABC１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday =  ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it '姓が全角（漢字・ひらがな・カタカナ）以外の場合、登録できない' do
      @user.last_name =  'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）を使用してください")
    end
    it '名が全角（漢字・ひらがな・カタカナ）以外の場合、登録できない' do
      @user.first_name =  'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）を使用してください")
    end
    it '姓カナが全角（カタカナ）以外の場合、登録できない' do
      @user.last_name_kana =  'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角（カタカナ）を使用してください")
    end
    it '名カナが全角（カタカナ）以外の場合、登録できない' do
      @user.first_name_kana =  'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）を使用してください")
    end
    it 'nicknameが空では登録できない' do
      @user.nickname =  ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
  end
end
