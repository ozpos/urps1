class Role < ActiveRecord::Base
  has_many :interactions, :dependent => :destroy
  has_many :controller_actions, :through => :interactions
  attr_accessible :name
end
