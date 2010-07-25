10.times do 
  kb = Factory.create(:knotebook)
  3.times do
    kb.add! Factory.create(:knote)
  end
end