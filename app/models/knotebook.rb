class Knotebook
  include Mongoid::Document

  field :title, :type => String
  field :abstract, :type => String
  embeds_many :knotes

  validates_presence_of :title, :abstract
  validates_associated :knotes

  def add(knote)
    self.knotes << knote.klone
  end

  def add!(knote)
    add(knote)
    save
  end

  def tags
    knotes.collect(&:tags).flatten.uniq.sort
  end

end
