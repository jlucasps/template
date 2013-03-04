class User < ActiveRecord::Base
  # Include default devise modules:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name


  # Validations
  validates :name, :presence => true, :allow_blank => false

  # Associations
  has_many :lists, :dependent => :destroy

  # Scopes
  default_scope order("users.name")


  # Public methods
  def other_users
    User.where("id != ?", self.id)
  end

end
