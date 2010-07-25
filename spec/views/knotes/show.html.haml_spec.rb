require 'spec_helper'

describe "knotes/show.html.haml" do
  before(:each) do
    @original = @knote = assign(:knote, stub_model(Knote,
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
  end
end
