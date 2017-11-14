module ApplicationHelper
  def user_already_voted?(poll, ip)
    vote_records = VoteRecord.where(answer: poll.answers).where(ip: ip)
    session['voted_in_poll_' + poll.id.to_s] == true || vote_records.count > 1
  end
end
