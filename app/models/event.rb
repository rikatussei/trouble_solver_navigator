class Event < ApplicationRecord
  # バリデーション
  validates :title, :description, :occurred_on, :location, :images, presence: true
  validates :occurred_on, inclusion: {
    in: (Date.new(1950, 1, 1)..Date.new(2200, 12, 31)),
    message: 'must be between January 1, 1950 and December 31, 2200'
  }
  validates :cause_type_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :images, presence: true

  # アソシエーション
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
  has_many_attached :images


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cause_type

  # 以下のアソシエーションは将来の利用予定
  # has_many :user_events
  # has_many :users, through: :user_events
  # has_many :support_tickets
end
