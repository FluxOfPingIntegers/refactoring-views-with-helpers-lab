class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    !!self.artist ? self.artist.name : false
  end

  def artist_name=(name)
    if !name.empty?
      artist = Artist.find_or_create_by(name: name)
      self.update(artist_id: artist.id)
      artist.songs << self
    end
  end
end
