require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/new" do
  before(:each) do
    @user = mock_model(User,
      :id => nil,
      :login => nil,
      :email => nil,
      :password => nil,
      :password= => nil,
      :password_confirmation => nil,
      :password_confirmation= => nil
    )
    assigns[:user] = @user

    render 'users/new'
  end
  
  it "should have a login field" do
    response.should have_tag("#user_login")
    response.should have_tag("label[for=user_login]")
  end

  it "should have an email field" do
    response.should have_tag("#user_email")
    response.should have_tag("label[for=user_email]")
  end

  it "should have a password field" do
    response.should have_tag("#user_password")
    response.should have_tag("label[for=user_password]")
  end

  it "should have a password confirmation field" do
    response.should have_tag("#user_password_confirmation")
    response.should have_tag("label[for=user_password_confirmation]")
  end

  it "should have a submit button" do
    response.should have_tag("input[type=submit]")
  end
end
