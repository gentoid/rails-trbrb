class Thing < ActiveRecord::Base
  class Create < Trailblazer::Operation

    def process(params)
      @model = Thing.create params[:thing].permit!
    end

  end
end
