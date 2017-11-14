class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates_presence_of :name
  accepts_nested_attributes_for :answers, allow_destroy: true
  validates_presence_of :answers
end
