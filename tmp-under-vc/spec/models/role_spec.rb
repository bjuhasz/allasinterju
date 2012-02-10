require 'spec_helper'

describe Role do
  it 'can find scopes beginning with a given char' do
    %w(alma almos aladar bela cecil).each do |name|
      Role.create(:name => name)
    end
    
    roles = Role.begins_with('a')
    roles.map { |r| r.name }.sort.should == %w(aladar alma almos)
  end
end

