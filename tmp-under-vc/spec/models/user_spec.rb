require 'spec_helper'

describe User do
  it 'requires a name 1.' do
    User.create(:name => 'Present').should be_valid
  end
  
  it 'requires a name 2.' do
    User.new.should_not be_valid
  end
  
  it 'does not allow mass assignement of :status' do
    expect do 
      User.create(:name => 'Name', :status => 'Status') 
    end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end
  
  it 'can list all of its permissions' do
    user = User.create(:name => 'Name')
    #permissions = [mock_model(Permission), mock_model(Permission)]
    permissions = [Permission.create, Permission.create]
    user.permissions = permissions
    #user.role = double(Role, :permissions => permissions)
    user.role = Role.create(:permissions => permissions)
    
    user.all_permissions.count.should == 4
  end
end

