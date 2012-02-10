require 'spec_helper'

describe "permissions/index" do
  before(:each) do
    assign(:permissions, [
      stub_model(Permission,
        :name => "Name"
      ),
      stub_model(Permission,
        :name => "Name"
      )
    ])
  end

  it "renders a list of permissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
