class StaticPagesController < ApplicationController
  def home
    @polls = Poll.all.order('created_at DESC')
  end
end
