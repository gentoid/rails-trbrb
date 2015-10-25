class Thing < ActiveRecord::Base

  scope :latest, lambda { all.limit(9).order id: :desc }

end
