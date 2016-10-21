class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :lender
  
  validates :amount,  numericality: { only_integer: true }
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true

end
