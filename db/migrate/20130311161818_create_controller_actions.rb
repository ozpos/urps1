class CreateControllerActions < ActiveRecord::Migration
  def change
    create_table :controller_actions do |t|
      t.string :name
      t.references :controller_name
      t.references :action_name

      t.timestamps
    end
    add_index :controller_actions, :controller_name_id
    add_index :controller_actions, :action_name_id
  end
end
