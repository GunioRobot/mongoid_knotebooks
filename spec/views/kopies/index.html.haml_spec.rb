require 'spec_helper'

describe "kopies/index.html.haml" do
  before(:each) do
    assign(:kopies, [
      stub_model(Kopy,
        :title => "Title",
        :body => "MyText"
      ),
      stub_model(Kopy,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of kopies" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
