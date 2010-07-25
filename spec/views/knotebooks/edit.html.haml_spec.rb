require 'spec_helper'

describe "knotebooks/edit.html.haml" do
  before(:each) do
    @knotebook = assign(:knotebook, stub_model(Knotebook,
      :new_record? => false,
      :title => "MyString",
      :abstract => "MyText"
    ))
  end

  it "renders the edit knotebook form" do
    render

    rendered.should have_selector("form", :action => knotebook_path(@knotebook), :method => "post") do |form|
      form.should have_selector("input#knotebook_title", :name => "knotebook[title]")
      form.should have_selector("textarea#knotebook_abstract", :name => "knotebook[abstract]")
    end
  end
end
