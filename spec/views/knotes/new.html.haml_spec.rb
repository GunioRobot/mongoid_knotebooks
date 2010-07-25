require 'spec_helper'

describe "knotes/new.html.haml" do
  before(:each) do
    assign(:knote, stub_model(Knote,
      :new_record? => true,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new knote form" do
    render

    rendered.should have_selector("form", :action => knotes_path, :method => "post") do |form|
      form.should have_selector("input#knote_title", :name => "knote[title]")
      form.should have_selector("textarea#knote_body", :name => "knote[body]")
    end
  end
end
