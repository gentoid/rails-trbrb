require_relative '../concepts/thing/crud'

class ThingsController < ApplicationController

  def new
    @form = ThingForm.new Thing.new
  end

  def create
    run Thing::Create do |op|
      return redirect_to op.model
    end

    render action: :new
  end

end
