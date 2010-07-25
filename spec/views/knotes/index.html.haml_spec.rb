require 'spec_helper'

describe "knotes/index.html.haml" do
  before(:each) do
    assign(:knotes, [
      stub_model(Knote,
        :title => "Title",
        :body => "MyText"
      ),
      stub_model(Knote,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of knotes" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
