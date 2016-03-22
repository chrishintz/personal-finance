class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true, if: :active?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, if: :active?
  validates_uniqueness_of :email, :username, if: :active?
  has_many :networths

  def active?
    status == 'active'
  end
end
