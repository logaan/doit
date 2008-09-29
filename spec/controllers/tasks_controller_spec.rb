require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TasksController do
  fixtures :users

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
    it "should redirect if user is not authorised" do
      get 'new'
      response.should be_redirect
    end

    it "should be successful" do
      login_as(:quentin)
      get 'new'
      response.should be_success
    end

    it "should assign a blank user object to work with" do
      login_as(:quentin)
      get 'new'
      assigns[:task].should_not be_nil
    end
  end

  describe "GET 'create'" do
    it "should redirect if user is not authorised" do
      get 'new'
      response.should be_redirect
    end

    it "should be successful" do
      login_as(:quentin)
      get 'create'
      response.should be_success
    end

    it "should allow creation" do
      login_as(:quentin)
      lambda do
        create_task
        response.should redirect_to(tasks_path)
      end.should change(Task, :count).by(1)
    end

    it "should set user_id to current logged-in user" do
      login_as(:quentin)
      create_task
      assigns[:task].user.should eql(users(:quentin))
    end

    it "should flash notice on success" do
      login_as(:quentin)
      create_task
      flash[:notice].should_not be_nil
    end

    it "should require name on creation" do
      login_as(:quentin)
      lambda do
        create_task(:name => nil)
        assigns[:task].errors.on(:name).should_not be_nil
        response.should be_success
      end.should_not change(Task, :count)
    end 

    it "should render 'new' view on failure" do
      login_as(:quentin)
      create_task(:name => nil)
      response.should render_template('tasks/new')
    end 
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @task = mock_model(Task)
      Task.stub!(:find).and_return(@task)
    end

    it "should redirect if user is not authorised" do
      get 'edit', :id => 1
      response.should be_redirect
    end

    it "should be successful" do
      login_as(:quentin)
      get 'edit', :id => 1
      response.should be_success
    end

    it "should load task into instance variable for view" do
      login_as(:quentin)
      Task.should_receive(:find).with('1').and_return(@task)
      get 'edit', :id => '1'
      assigns[:task].should eql(@task)
    end
  end

  describe "GET 'update'" do
    it "should redirect if user is not authorised" do
      get 'update'
      response.should be_redirect
    end

    it "should be successful" do
      login_as(:quentin)
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should redirect if user is not authorised" do
      get 'destroy'
      response.should be_redirect
    end

    it "should be successful" do
      login_as(:quentin)
      get 'destroy'
      response.should be_success
    end
  end

  def create_task(options = {})
    post :create, :task => { :name => 'test task', :user_id => '1' }.merge(options)
  end

end
