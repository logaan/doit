require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Task do
  it "should create a new instance given valid attributes" do
    lambda { create_task }.should change(Task, :count).by(+1) 
  end

  it "should require a name" do
    lambda do
      task = create_task :name => nil
      task.should_not be_valid
    end.should_not change(Task, :count)
  end

protected
  def create_task(options = {})
    record = Task.new({ :name => "fix bug" }.merge(options))
    record.save
    record
  end
end
