require 'spec_helper'

describe "knotes/edit.html.haml" do
  before(:each) do
    @knote = assign(:knote, stub_model(Knote,
      :new_record? => false,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit knote form" do
    render

    rendered.should have_selector("form", :action => knote_path(@knote), :method => "post") do |form|
      form.should have_selector("input#knote_title", :name => "knote[title]")
      form.should have_selector("textarea#knote_body", :name => "knote[body]")
    end
  end
end
