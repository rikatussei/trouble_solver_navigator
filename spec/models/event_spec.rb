require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event, user: @user) 
  end

  describe '商品の出品' do
    context '出品ができる場合' do
      it 'imagesとtitle、descriptionとoccurred_on,locationとcause_type_idが存在すれば投稿できる' do
        expect(@event).to be_valid
      end

      it 'detailed_causeが存在しなくても投稿できる' do
        @event.detailed_cause = ""
        expect(@event).to be_valid
      end

      it 'resolutionが存在しなくても投稿できる' do
        @event.resolution = ""
        expect(@event).to be_valid
      end
    end

    context '出品ができない場合' do
      it 'ユーザー情報がない場合は投稿できないこと' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include('User must exist')
      end

      it 'imagesが空では投稿できない' do
        @event.images = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Images can't be blank")
      end

      it 'titleが空では投稿できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end

      it 'descriptionが空では投稿できない' do
        @event.description  = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Description can't be blank")
      end

      it 'occurred_onが空では投稿できない' do
        @event.occurred_on =  ""
        @event.valid?
        expect(@event.errors.full_messages).to include("Occurred on can't be blank", "Occurred on must be between January 1, 1950 and December 31, 2200")
      end

      it 'occurred_onの日付が1950年1月1日以前では投稿できない' do
        @event.occurred_on = Date.new(1949, 12, 31)
        @event.valid?
        expect(@event.errors.full_messages).to include("Occurred on must be between January 1, 1950 and December 31, 2200")
      end

      it 'occurred_onの日付が2200年12月31日以降では投稿できない' do
        @event.occurred_on = Date.new(2201, 1, 1)
        @event.valid?
        expect(@event.errors.full_messages).to include("Occurred on must be between January 1, 1950 and December 31, 2200")
      end

      it 'locationが空では投稿できない' do
        @event.location = ""
        @event.valid?
        expect(@event.errors.full_messages).to include("Location can't be blank")
      end

      it 'cause_type_idが空では投稿できない' do
        @event.cause_type_id = 1
        @event.valid?
        expect(@event.errors.full_messages).to include("Cause type can't be blank")
      end
    end
  end
end
