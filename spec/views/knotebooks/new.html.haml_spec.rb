require 'spec_helper'

describe "knotebooks/new.html.haml" do
  before(:each) do
    assign(:knotebook, stub_model(Knotebook,
      :new_record? => true,
      :title => "MyString",
      :abstract => "MyText"
    ))
  end

  it "renders new knotebook form" do
    render

    rendered.should have_selector("form", :action => knotebooks_path, :method => "post") do |form|
      form.should have_selector("input#knotebook_title", :name => "knotebook[title]")
      form.should have_selector("textarea#knotebook_abstract", :name => "knotebook[abstract]")
    end
  end
end
