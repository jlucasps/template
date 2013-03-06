class Favorite < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :list_id

  # Validations
  validates :user_id, :presence => true
  validates :list_id, :presence => true
  validates_uniqueness_of :list_id, :scope => :user_id

  # Associations
  belongs_to :user
  belongs_to :list

  # Scopes
  default_scope order("favorites.created_at DESC")

end
