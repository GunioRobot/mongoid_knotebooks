# This class is meant to be a direct clone of Knote.rb, with the exception of the embedded_in call
class Kopy
  include Mongoid::Document
  include Mongoid::Versioning

  field :title, :type => String
  field :body, :type => String
  field :tags, :type => Array

  embedded_in :knotebook, :inverse_of => :knotes
  referenced_in :knote

  validates_presence_of :title, :body, :tags

end
