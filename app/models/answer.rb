class Answer < ActiveRecord::Base
  belongs_to :poll
  has_many :vote_records, dependent: :destroy

  validates_presence_of :name

  def votes
    VoteRecord.where(answer_id: id).count
  end
end
