class User < ActiveRecord::Base
  has_many :permissions #, :dependent => :destroy
  has_one :role
  
  validates :name, :presence => true
  attr_protected :status
  
  def all_permissions
    permissions + role.permissions
  end
end
