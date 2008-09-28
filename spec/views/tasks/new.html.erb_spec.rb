require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tasks/new" do
  before(:each) do
    @new_task = mock_model(Task, :name => nil).as_new_record

    assigns[:task] = @new_task

    render 'tasks/new'
  end
  
  it "should have a form for entering task details" do
    response.should have_tag('form#new_task')
  end

  it "should have a labelled name field" do
    response.should have_tag("label[for=task_name]")
    response.should have_tag("#task_name")
  end
end
