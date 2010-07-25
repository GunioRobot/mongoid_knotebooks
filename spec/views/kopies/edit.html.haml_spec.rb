require 'spec_helper'

describe "kopies/edit.html.haml" do
  before(:each) do
    @kopy = assign(:kopy, stub_model(Kopy,
      :new_record? => false,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit kopy form" do
    render

    rendered.should have_selector("form", :action => kopy_path(@kopy), :method => "post") do |form|
      form.should have_selector("input#kopy_title", :name => "kopy[title]")
      form.should have_selector("textarea#kopy_body", :name => "kopy[body]")
    end
  end
end
