require_relative '../concepts/thing/crud'

class ThingsController < ApplicationController

  def new
    @form = ThingForm.new Thing.new
  end

  def create
    @form = ThingForm.new Thing.new

    if @form.validate params[:thing]
      @form.save
      return redirect_to @form.model
    end

    render action: :new
  end

end
