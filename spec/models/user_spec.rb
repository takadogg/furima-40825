require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do 
    context '新規登録できる場合' do
      it "各項目が適切に存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
     it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1a234'
        @user.password_confirmation = '1a234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password =  '1a' + Faker::Internet.password(min_length: 127, max_length: 148)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが英数混合ではないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1a2345'
        @user.password_confirmation = '1a23456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it 'first_nameが漢字・ひらがな・カタカナ以外では登録できない' do
        @user.first_name = 'AAAA'  
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name 全角文字を使用してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it 'last_nameが漢字・ひらがな・カタカナ以外では登録できない' do
        @user.last_name = 'AAAA'  
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name 全角文字を使用してください")
      end


      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'ああああ'  
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana 全角カナ文字を使用してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'ああああ'  
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana 全角カナ文字を使用してください")
      end



      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birth date can't be blank")
      end
    end
  end
end