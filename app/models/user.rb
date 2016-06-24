class User < ActiveRecord::Base

  has_many :adds
  has_many :songs, through: :adds

  has_secure_password

  validates :first_name, :last_name, :email, :password, presence: true
  validates :password, length: { minimum: 8 }, on: :create
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :format => { :with => email_regex }, :uniqueness => {:case_sensitive => false, :message => 'Email already exists!'}
end
