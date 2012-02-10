require 'spec_helper'

describe "permissions/show" do
  before(:each) do
    @permission = assign(:permission, stub_model(Permission,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
