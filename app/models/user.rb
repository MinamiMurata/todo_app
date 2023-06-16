class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :tasks, dependent: :destroy

  enum admin: { admin_user: true, general_user: false }
  validates :admin, inclusion: { in: %w[admin_user general_user] }

  before_destroy { throw(:abort) if User.where(admin: true).count <= 1 && self.admin? }
end
