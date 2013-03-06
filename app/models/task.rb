class Task < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :description, :list_id

  # Validations
  validates :description, :presence => true, :allow_blank => false
  validates :list_id, :presence => true

  # Associations
  belongs_to :list

  # Scopes
  default_scope order("tasks.created_at ASC")

end