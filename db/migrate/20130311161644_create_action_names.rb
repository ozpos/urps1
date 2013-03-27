class CreateActionNames < ActiveRecord::Migration
  def change
    create_table :action_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
