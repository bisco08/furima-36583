require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname, email, password, password_confirmation, family_name, first_name,
          family_name_kana, first_name_kana, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上だと登録できる' do
        @user.password = 'aaaa09'
        @user.password_confirmation = 'aaaa09'
        expect(@user).to be_valid
      end
    end
     
    context '新規登録できないとき' do
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
      it '重複したemailの場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていなければ登録できない' do
        @user.email = 'furimafurima.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 
      it 'passwordが５文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = 'qqqqqq'
        @user.password = 'qqqqqq'
        @user.valid?  
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
      end
      it 'passwordが全角文字のみでは登録できない' do 
        @user.password = 'QQQQQQ'
        @user.password = 'QQQQQQ'
        @user.valid?  
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
      end
      it 'passwordが半角数値のみでは登録できない' do
        @user.password = '123456'
        @user.password = '123456'
        @user.valid?  
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
      end     
      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name には全角文字を使用してください")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end
      it 'family_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.family_name = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name には全角文字を使用してください')
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.first_name = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
      end
      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana には全角カタカナを使用してください")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana には全角カタカナを使用してください")
      end
      it 'family_name_kanaが全角カタカナでないと登録できない' do
        @user.family_name_kana = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana には全角カタカナを使用してください')
      end
      it 'first_name_kanaが全角カタカナでないと登録できない' do
        @user.first_name_kana = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana には全角カタカナを使用してください')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end