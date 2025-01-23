require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合'do
    it 'nicknameとemail、passwordとpassword_confiramation,first_name,last_name,first_name_furigana,last_name_furigana,birthdayが存在すれば登録できる' do
    expect(@user).to be_valid
    end
    it "passwordが6文字以上の半角英数字混合であれば登録できる" do
      @user.password = "111111a"
      @user.password_confirmation = "111111a"
      expect(@user).to be_valid
    end
    it "first_nameが全角文字であれば登録できる" do
      @user.first_name = "やマ田"
      expect(@user).to be_valid
    end
    it "last_nameが全角文字であれば登録できる" do
      @user.last_name = "はナ子"
      expect(@user).to be_valid
    end
    it "first_name_kanaが全角カナであれば登録できる" do
      @user.first_name_furigana = "ヤマダ"
      expect(@user).to be_valid
    end
    it "last_name_kanaが全角カナであれば登録できる" do
      @user.last_name_furigana = "ハナコ"
      expect(@user).to be_valid
    end
  end


    context '新規登録できない場合'do
      it 'ニックネームが必須' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it'メールアドレスが必須' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'メールアドレスが一意性'do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it'メールアドレスが＠を含む'do
      @user.email='1234.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスは不正な値です') 
      end
      it'パスワードが必須' do
      @user.password =''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it'パスワードは6文字以上'do
      @user.password = 'asd12'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードは半角英数字混合の入力が必須'do
      @user.password ='1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'パスワードとパスワード（確認）は値が一致する'do
      @user.password_confirmation = 'asd1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
      it '名字が必須' do
      @user.first_name =''
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前（姓）を入力してください')
      end
      it '名前が必須' do
      @user.last_name =''
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前（名）を入力してください')
      end
      it'名字は全角（漢字・ひらがな・カタカナ）で入力' do
      @user.first_name ='yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前（姓）全角文字を使用してください")
      end
      it'名前は全角（漢字・ひらがな・カタカナ）で入力' do
      @user.last_name ='hanako'
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前（名）全角文字を使用してください")
      end
      it 'first_name_furiganaは必須' do
       @user.first_name_furigana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include('お名前カナ（姓）を入力してください')
      end
      it'last_name_furiganaは必須'do
      @user.last_name_furigana=''
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ（名）を入力してください')
     end
     it'first_name_furiganaは全角カタカナで入力'do
      @user.first_name_furigana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ（姓）全角カナを使用してください')
    end
    it'last_name_furiganaは全角カタカナで入力'do
      @user.last_name_furigana = 'hanako'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ（名）全角カナを使用してください')
    end
    it '生年月日が必須' do
      @user.birth_date=''
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
  end
end
