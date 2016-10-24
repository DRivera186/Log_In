class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :lender
  
  validates :amount,  numericality: { only_integer: true }

end
