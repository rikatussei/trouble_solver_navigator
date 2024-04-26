class Event < ApplicationRecord



  belongs_to :user


  has_many :user_events
  has_many :users, through: :user_events
  # has_many :comments
  # has_many :support_tickets
  has_one_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cause_type
 
  validates :cause_type_id, numericality: { other_than: 1, message: "can't be blank"} 

end
