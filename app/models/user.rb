class User < ActiveRecord::Base
  has_secure_password
  belongs_to :network, class_name: "User"
  has_many :connections, foreign_key: "user_id" 
  has_many :invitations, foreign_key: "user_id"
  has_many :other_users, through: :invitations
  has_many :other_users, through: :connections
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  NAME_REGEX = /\A^[-a-z]+$\z/i
  validates :name, :email, :description, presence: true
  validates :email, format: {with: EMAIL_REGEX}
  validates :name, format: {with: NAME_REGEX}
end
