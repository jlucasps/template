class CrateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :list, :foreign_key => true
      t.text :description, :null => false
      t.timestamps
    end
    add_index :tasks, :list_id
  end

end
