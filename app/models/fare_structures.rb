class FareStructures < ActiveRecord::Base

  #associations
  belongs_to :service

  # attr_accessible :title, :body
end
