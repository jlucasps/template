class CreateFavoritesTable < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :list, :foreign_key => true
      t.references :user, :foreign_key => true
      t.timestamps
    end
    add_index :favorites, :list_id
    add_index :favorites, :user_id
  end

end
