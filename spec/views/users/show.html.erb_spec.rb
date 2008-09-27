require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show" do
  before(:each) do
    @user = mock User
    @user.stub!(:login).and_return("freddy")

    assigns[:user] = @user

    render 'users/show'
  end
  
  it "should display the users details" do
    response.should have_tag("#user") do
      with_tag("#login", "freddy")
    end
  end

end
