require 'spec_helper'

describe Kopy do
  it "should come from a Knote" do
    @knote = Factory.build(:knote)
    @kopy = @knote.klone

    @kopy.title.should == @knote.title
    @kopy.body.should == @knote.body
    @kopy.knote.should == @knote
    @kopy.knote_id.should == @knote._id
    @kopy.should be_valid
  end
end
