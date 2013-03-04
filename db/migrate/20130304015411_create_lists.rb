class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, :null => false
      t.boolean :private
      t.references :user, :foreign_key => true
      t.timestamps
    end
  end

end
