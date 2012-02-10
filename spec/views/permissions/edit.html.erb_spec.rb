require 'spec_helper'

describe "permissions/edit" do
  before(:each) do
    @permission = assign(:permission, stub_model(Permission,
      :name => "MyString"
    ))
  end

  it "renders the edit permission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => permissions_path(@permission), :method => "post" do
      assert_select "input#permission_name", :name => "permission[name]"
    end
  end
end
