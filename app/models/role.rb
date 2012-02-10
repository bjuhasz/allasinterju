class Role < ActiveRecord::Base
  has_many :permissions #, :dependent => :destroy
  belongs_to :user
  
  scope :begins_with, lambda { |char| where("name LIKE ?", "#{char}%") }
end
