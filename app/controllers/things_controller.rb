class ThingsController < ApplicationController

  def new
    form Thing::Create
  end

  def create
    run Thing::Create do |op|
      return redirect_to op.model
    end

    render action: :new
  end

  def edit
    form Thing::Update

    render action: :new
  end

  def show
    present Thing::Update
    @thing = @model
    form Comment::Create
  end

  def create_comment
    present Thing::Update
    @thing = @model
    run Comment::Create

    render :show
  end

end
