class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.references :controller_action
      t.references :role

      t.timestamps
    end
    add_index :interactions, :controller_action_id
    add_index :interactions, :role_id
  end
end
