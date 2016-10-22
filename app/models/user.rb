class User < ActiveRecord::Base
  has_secure_password
 	has_many :histories
  # validates :password, :presence => true, :on => :create
  validates :first_name, :last_name, :purpose, :description, :money,  :presence => true
  validates :money,  numericality: { only_integer: true }
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true

end
