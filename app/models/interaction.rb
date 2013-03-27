class Interaction < ActiveRecord::Base
  belongs_to :controller_action
  belongs_to :role
  attr_accessor :enable # nice little thingy here
  attr_accessible :enable, :controller_action_id, :role_id
end
