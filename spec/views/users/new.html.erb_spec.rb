require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/new" do
  before(:each) do
    errors = mock "errors"
    errors.stub!(:count).and_return(0)

    @user = mock User
    @user.stub!(:password_confirmation=)
    @user.stub!(:password=)
    @user.stub!(:errors).and_return(errors)
    @user.stub!(:login)
    @user.stub!(:email)
    @user.stub!(:password)
    @user.stub!(:password_confirmation)
    assigns[:user] = @user

    render 'users/new'
  end
  
  it "should have a login field"

  it "should have an email field"

  it "should have a password field"

  it "should have a password confirmation field"
end
