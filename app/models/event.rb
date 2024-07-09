class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :occurred_on, presence: true, inclusion: {
    in: (Date.new(1950, 1, 1)..Date.new(2200, 12, 31)),
    message: 'must be between January 1, 1950 and December 31, 2200'
  }
  validates :location, presence: true
  validates :images, presence: true

  belongs_to :user
  # has_many :user_events
  # has_many :users, through: :user_events
  has_many :comments, dependent: :destroy
  # has_many :support_tickets
  has_one_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cause_type
  validates :cause_type_id, numericality: { other_than: 1, message: "can't be blank"} 

end
