require 'spec_helper'

describe "knotebooks/show.html.haml" do
  before(:each) do
    @knotebook = assign(:knotebook, stub_model(Knotebook,
      :title => "Title",
      :abstract => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
  end
end
