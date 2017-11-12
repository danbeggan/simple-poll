class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  # TODO: Update error messages
  validates_presence_of :name
  accepts_nested_attributes_for :answers
  validates_presence_of :answers
end