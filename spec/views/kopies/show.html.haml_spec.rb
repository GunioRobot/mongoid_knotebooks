require 'spec_helper'

describe "kopies/show.html.haml" do
  before(:each) do
    @kopy = assign(:kopy, stub_model(Kopy,
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
