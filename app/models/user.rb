class User < ActiveRecord::Base

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  before_validation :create_slug
  
  has_secure_password
  has_many :reviews
  
  # enum role: { admin: 0, consumer: 1 }
  # after_initialize :set_default_role, :if => :new_record?

  def to_param
    slug
  end

  def set_default_role
    self.role ||= :consumer
  end

  # def set_default_role
  #   self.role ||= :consumer
  # end
  
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, length: 8..30

  private
    def create_slug
      self.slug = first_name.parameterize
    end
end
