class ControllerName < ActiveRecord::Base
  attr_accessor :enable # nice little thingy here
  attr_accessible :enable
  attr_accessible :name, :controller_actions_attributes, :interactions_attributes #, :roles_attributes,
  attr_accessible :action_name_id, :controller_name_id

  has_many :controller_actions, :as => :securable
  has_many :interactions, :through => :controller_actions
  has_many :roles, :through => :interactions

  accepts_nested_attributes_for :controller_actions, :interactions, :roles, :allow_destroy => true

end
