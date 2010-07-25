require 'spec_helper'

describe "knotebooks/index.html.haml" do
  before(:each) do
    assign(:knotebooks, [
      stub_model(Knotebook,
        :title => "Title",
        :abstract => "MyText"
      ),
      stub_model(Knotebook,
        :title => "Title",
        :abstract => "MyText"
      )
    ])
  end

  it "renders a list of knotebooks" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
