# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MAX_ROLE_ACCESS_LEVEL = 2**31

max_role = Role.find_by_name('Webmaster')
if max_role.nil?
  Role.create!([{:name => 'Webmaster'},
                {:name => 'Admin'},
                {:name => 'Moderator'},
                {:name => 'Editor'},
                {:name => 'Registered User'},
                {:name => 'Guest'}])
  max_role = Role.find_by_name('Webmaster')
end

# Define all resources
Rails.application.reload_routes!
all_routes = Rails.application.routes.routes

require 'rails/application/route_inspector'
inspector = Rails::Application::RouteInspector.new
r =[]
for routeRule in inspector.format(all_routes, ENV['CONTROLLER'])
  # Parse routeRule to get your values
  routeRule.split(' ').each do |s|
    r << s if s.include?('#')
  end
end
r.uniq!

# Populate a table of controller and action names.
# Create Webmaster default role for each secure_resource.
ca=[]
r.each do |route|
  ca = route.split('#')
  c = ControllerName.find_or_create_by_name(ca[0])
  a = ActionName.find_or_create_by_name(ca[1])

  res = ControllerAction.find_or_create_by_name(route, :controller_name_id => c.id, :action_name_id => a.id)
  if !res.roles.include? 'Webmaster'
    role = Role.find_by_name('Webmaster')
    Interaction.create!([{:role_id => role.id, :controller_action_id => res.id}])
  end
end

