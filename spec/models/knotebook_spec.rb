require 'spec_helper'

describe Knotebook do
  it "should transparently create Kopies of Knotes" do
    @knotebook = Factory.create(:knotebook)
    @knote = Factory.create(:knote)
    @knotebook.add @knote
    @knotebook.should have(1).knote
    @knotebook.knotes.first.should be_a_kind_of(Kopy)
  end
end
