require 'spec_helper'

describe Knote do
  it "should not have a kopy_id" do
    knote = Factory.create(:knote)
    knote.should_not respond_to(:knote_id)
    knote.should_not respond_to(:kopy_id)
  end
  
  it "should be able to swap" do
    alpha = Factory.create(:knote, :title => "alpha", :tags => %w{alpha beta delta})
    beta  = Factory.create(:knote, :title => "beta",  :tags => %w{alpha beta})
    delta = Factory.create(:knote, :title => "delta", :tags => %w{alpha delta})
    
    alpha.swap.should include(beta, delta)
    beta.swap.should include(alpha)
    delta.swap.should include(alpha)
    alpha.swap.should_not include(alpha)
  end
end
