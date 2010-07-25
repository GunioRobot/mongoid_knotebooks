require 'spec_helper'

describe "kopies/new.html.haml" do
  before(:each) do
    assign(:kopy, stub_model(Kopy,
      :new_record? => true,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new kopy form" do
    render

    rendered.should have_selector("form", :action => kopies_path, :method => "post") do |form|
      form.should have_selector("input#kopy_title", :name => "kopy[title]")
      form.should have_selector("textarea#kopy_body", :name => "kopy[body]")
    end
  end
end
