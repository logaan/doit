require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index" do
  describe "with no users" do
    before do
      assigns[:users] = []
      render "users/index"
    end

    it "should tell you where to find the file" do
      response.should have_tag('p', "No Users.")
    end
  end

  describe "with users" do
    before do
      @user = mock User
      @user.stub!(:login).and_return("freddy")
      assigns[:users] = [@user]
      render "users/index"
    end

    it "should list the users logins" do
      response.should have_tag("ul#users") do
        with_tag("li.user", "freddy")
      end
    end
  end
end
