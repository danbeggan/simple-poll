class PollsController < ApplicationController
  before_action :find_poll, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
    @polls = Poll.where(user: current_user).order('created_at DESC')
  end

  def show
  end

  def new
    @poll = Poll.new
    # Give default 2 answer spaces
    2.times { @poll.answers.build }
  end

  def create
    @poll = current_user.polls.build(poll_params)
    if @poll.save
      flash[:notice] = "Poll created"
      redirect_to @poll
    else
      flash[:alert] = "Poll unable to save"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @poll.update poll_params
      flash[:notice] = "Poll update was successful"
      redirect_to @poll
    else
      render 'edit'
    end
  end

  def destroy
    @poll.destroy
    redirect_to polls_path
  end

  private

  def poll_params
    params.require(:poll).permit(:name, :answers_attributes => [:id, :name, :_destroy])
  end

  def find_poll
    @poll = Poll.find params[:id]
  end
end
