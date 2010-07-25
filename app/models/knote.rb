class Knote
  include Mongoid::Document
  include Mongoid::Versioning

  field :title, :type => String
  field :body, :type => String
  field :tags, :type => Array
  
  references_one :kopy
  
  validates_presence_of :title, :body, :tags
  
  # This is the critital method that allows a knotebook to add a knote (but get a Kopy)
  def klone
    Kopy.new(self.attributes.slice(:title, :body, :tags).merge({ :knote => self }))
  end
  
  scope :swap, lambda {|*tags| any_in(:tags => tags) }
  
  def swap
    knotes = Knote.swap(tags)
    knotes.delete(self)
    knotes
  end
end
