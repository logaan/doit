require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Task do
  describe "when creating" do
    it "should create a new instance given valid attributes" do
      lambda { create_task }.should change(Task, :count).by(+1) 
    end

    it "should require a name" do
      lambda do
        task = create_task :name => nil
        task.should_not be_valid
      end.should_not change(Task, :count)
    end
  end

  describe "with fixtures loaded" do
    fixtures :tasks, :users

    it "should have a user" do
      add_feature = Task.find(1)
      add_feature.user.should_not be_nil
    end

  end

protected
  def create_task(options = {})
    record = Task.new({ :name => "fix bug" }.merge(options))
    record.save
    record
  end
end
