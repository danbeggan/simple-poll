class AnswersController < ApplicationController
  def update
    poll = Poll.find(params[:poll_id])
    answer = poll.answers.find(params[:id])

    # Check if vote allowed [ip & session]
    unless user_already_voted?(poll, request.remote_ip)
      vote_record = VoteRecord.new(ip: request.remote_ip, answer: answer)
      vote_record.save
      session['voted_in_poll_' + poll.id.to_s] = true
    end

    render json: poll.to_json(include: { answers: { methods: :votes } })
  end
end
