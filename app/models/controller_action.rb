class ControllerAction < ActiveRecord::Base
  belongs_to :controller_names
  belongs_to :action_names
  belongs_to :securable, :polymorphic => true
  has_many :interactions, :dependent => :destroy
  has_many :roles, :through => :interactions
  accepts_nested_attributes_for :controller_names, :action_names, :roles, :interactions, :allow_destroy => true
  attr_accessible :name
  attr_accessible :controller_name_id, :action_name_id, :role_id, :interactions_attributes

  scope :controllers, lambda {|name| where("controller_name_id = ?", name)}
  scope :actions, lambda {|name| where("action_name_id = ?", name)}

  def initialized_interactions() # this is the key method
    [].tap do |o|
      Role.all.each do |r|
        if p = interactions.find { |p| p.role_id == r.id }
          o << p.tap { |p| p.enable ||= true }
        else
          o << Interaction.new(:role_id => r.id)
        end
      end
    end
  end
end
