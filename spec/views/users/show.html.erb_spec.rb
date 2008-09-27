require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show" do
  before(:each) do
    @freddy = mock User
    @freddy.stub!(:login).and_return("freddy")
    @freddy.stub!(:tasks).and_return([])

    assigns[:user] = @freddy
  end
  
  describe "baseline functionality" do
    before do
      render 'users/show'
    end

    it "should display the users details" do
      response.should have_tag("#user") do
        with_tag("#login", "freddy")
      end
    end

    it "should not display tasks" do
      response.should_not have_tag("#user #tasks")
    end
  end

  describe "when the user has tasks" do
    before do
      @fix_bug = mock Task
      @fix_bug.stub!(:name).and_return("fix bug")
      @fix_bug.stub!(:class).and_return(Task)

      @freddy.stub!(:tasks).and_return([@fix_bug])

      render 'users/show'
    end

    it "should display the users tasks" do
      response.should have_tag("#user #tasks") do
        with_tag(".task") do
          with_tag(".name", "fix bug")
        end
      end
    end
  end
end
