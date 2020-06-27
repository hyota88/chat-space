require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'messageを保存できる場合' do
      it 'contentがあれば保存できること' do
        expect(build(:message, image:nil)).to be_valid
      end

      it 'imageがあれば保存できる場合' do
        expect(builed(:message, content: nil)).to be_valid
      end

      it 'content と image があれば保存できること' do
        expect(build(:message)).to be_valid
      end
    end

    context 'messageが保存できない場合'
      it 'content と image が両方なければ保存できないこと' do
        message = build(:message, content: nil, image: nil )
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end

      it 'group_id がないと保存できないこと' do
        message = build(:meassage, group_id: nil)
        expect(message.errors[：group]).to include("を入力してください")
      end

      it 'user_idがないと保存できないこと' do
        message = build(:message, user_id, nil)
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end
