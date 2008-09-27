require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TasksController do

  it "should use TasksController" do
    controller.should be_an_instance_of(TasksController)
  end

  describe "GET 'index'" do
    describe "when un-filtered" do
      before do
        @fix_bug = mock "fix bug"
        @rake_lawn = mock "rake lawn"

        Task.stub!(:find).with(:all).and_return([@fix_bug, @rake_lawn])
      end

      it "should be successful" do
        get 'index'
        response.should be_success
      end

      it "should assign all tasks" do
        get 'index'
        assigns[:tasks].should == [@fix_bug, @rake_lawn]
      end
    end

    describe "when filtered by user" do
      before do
        @rake_lawn = mock Task

        @freddy = mock User
        @freddy.stub!(:tasks).and_return([@rake_lawn])

        User.stub!(:find).and_return(@freddy)

        @params = {:user_id => 1}
      end

      it "should be successful" do
        get 'index', @params
        response.should be_success
      end

      it "should assign the users tasks" do
        get 'index', @params
        assigns[:tasks].should == [@rake_lawn]
      end
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should assign a blank user object to work with" do
      get 'new'
      assigns[:task].should_not be_nil
    end
  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "should be successful" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy'
      response.should be_success
    end
  end
end
