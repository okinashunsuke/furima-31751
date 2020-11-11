# pictweetから引用
require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが40文字以下で登録できる" do
        @user.nickname = "1234567890"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが40文字以上であれば登録できない" do
        @user.nickname = "12345678901234567890123456789012345678901234567890"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end
      it "passwordが6文字以下であれば登録できない" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが全角でなければ登録できない" do
        @user.first_name = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが全角でなければ登録できない" do
        @user.last_name = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが全角カタカナでなければ登録できない" do
        @user.first_name_kana = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "last_name_kanaが全角カタカナでなければ登録できない" do
        @user.last_name_kana = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "emailには@を含めなければ登録できない" do
        @user.email = "com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "password:半角英数混合(半角英語のみ)" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password_confirmation = @user.password + "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end


# 38:    it “emailに@が含まれていないと登録できない” do
#   39:     @user.email = ‘@’
#   40:     @user.valid?
#  => 41:     binding.pry
#   42:     expect(@user.errors.full_messages).to include()
#   43:    end
# 私たちのbinding.pryすればわかりますよ！！
# 19:15
# expectのあとの情報をターミナルで入力したら池間す！

