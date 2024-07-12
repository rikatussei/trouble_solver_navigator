require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event, user: @user) 
    @comment = FactoryBot.build(:comment, user: @user, event: @event)
  end

  describe 'コメントの投稿' do
    context 'コメントの投稿ができる場合' do
      it 'contentが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントの投稿ができない場合' do
      it 'ユーザー情報がなければ投稿できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end

      it 'イベント情報がなければ投稿できないこと' do
        @comment.event = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Event must exist')
      end

      it 'コメントの内容がなければ投稿できないこと' do
        @comment.content = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end
