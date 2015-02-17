require "utify/version"

require 'rspotify'
require 'youtube_search'

class Utify
  
  def searchFromFile(filepath)
    tracks = IO.readlines(filepath)

    tracks.each do | track |
      title = self.get_track(track)
      video_id = YoutubeSearch.search(title).first['video_id']
      self.download_track(title, "https://www.youtube.com/watch?v=#{video_id}")
    end
  end

  def get_track(uri)
    id = uri.strip.split('/').last
    track = RSpotify::Track.find(id)
    "#{track.name} - #{track.artists[0].name}"
  end

  def download_track(title, clip)
    cmd = `youtube-dl --no-progress --extract-audio --audio-format=mp3  --output="#{title}.mp3" #{clip} > /dev/null`
    system(cmd)
  end

end
