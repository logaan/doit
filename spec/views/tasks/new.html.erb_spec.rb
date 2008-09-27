require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tasks/new" do
  before(:each) do
    @new_task = mock_model(Task).as_new_record

    assigns[:task] = @new_task

    render 'tasks/new'
  end
  
  it "should have a form for entering task details" do
    # Giving up on this one. Form for doesn't seem to
    # play nicely with mock model

    response.should have_tag('form#new_task')
  end
end
