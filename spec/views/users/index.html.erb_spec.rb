require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :status => "Status",
        :role => stub_model(Role, :name => 'role')
      ),
      stub_model(User,
        :name => "Name",
        :status => "Status",
        :role => stub_model(Role, :name => 'role')
      )
    ])
    
    assign(:user, stub_model(User, :name => 'name', 
      :role => stub_model(Role, :name => 'role')))
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
