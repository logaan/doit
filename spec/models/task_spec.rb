require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Task do
  before(:each) do
    @valid_attributes = {
      :name => "fix validation bug"
    }
  end

  it "should create a new instance given valid attributes" do
    Task.create!(@valid_attributes)
  end

  it "should require a name" do
    attributes_without_name = @valid_attributes.reject{|k, v| k == :name}
    task = Task.new(attributes_without_name)
    task.should_not be_valid
  end
end
