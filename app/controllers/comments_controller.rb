class CommentsController < ApplicationController

  def new
    @thing = Thing.find params[:thing_id]

    form Comment::Create
  end

  def create
    run Comment::Create
  end

end
