require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tasks/edit" do
  before(:each) do
    @task = mock_model(Task, :id => 1, :name => 'cheese')

    assigns[:task] = @task

    render 'tasks/edit'
  end
  
  it "should have a form for entering task details" do
    response.should have_tag('form#edit_task_1')
  end

  it "should have a labelled name field" do
    response.should have_tag("label[for=task_name]")
    response.should have_tag("#task_name")
  end

  it "should preload current value into task_name text field" do
    response.should have_tag("#task_name[value='cheese']")
  end

end
