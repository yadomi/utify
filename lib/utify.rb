require "utify/version"

require 'rspotify'
require 'youtube_search'
require 'ruby-youtube-dl'

class Utify
  
  def searchFromFile(filepath)
    File.readlines(filepath).each do |line|
      clip =  YoutubeSearch.search(self.getTrack(line)).first['id']
      cmd = `youtube-dl --no-progress --extract-audio --audio-format=mp3  --output="Test1.mp3" #{clip}`.strip
      system(cmd)
    end
  end


  def getTrack(uri)
    track = RSpotify::Track.find(uri.split('/').last)
    "#{track.name} - {track.artists[0].name}"
  end

end
