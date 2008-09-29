require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tasks/index" do
  fixtures :users

  describe "when there are tasks to display" do
    before(:each) do
      @add_feature = mock Task
      @add_feature.stub!(:name).and_return("add feature")
      @add_feature.stub!(:class).and_return(Task)

      assigns[:tasks] = [@add_feature]

      render 'tasks/index'
    end

    it "should display the tasks" do
      response.should have_tag('#tasks') do
        with_tag(".task") do
          with_tag(".name", "add feature")
          without_tag(".edit_task", "edit")
          without_tag(".destroy_task", "delete")
        end
      end
    end   
  end

  describe "when logged in" do
    before(:each) do
      login_as(:quentin)
      @add_feature = mock Task
      @add_feature.stub!(:name).and_return("add feature")
      @add_feature.stub!(:class).and_return(Task)

      assigns[:tasks] = [@add_feature]

      render 'tasks/index'
    end

    it "should display the tasks with edit/delete links" do
      response.should have_tag('#tasks') do
        with_tag(".task") do
          with_tag(".name", "add feature")
          with_tag(".edit_task", "edit")
          with_tag(".destroy_task", "delete")
        end
      end
    end
  end

  describe "when there are no tasks to display" do
    before do
      assigns[:tasks] = []
      render 'tasks/index'
    end

    it "should say there are no tasks" do
      response.should have_tag('p', "No Tasks.")
    end
  end
end
