require "utify/version"

require 'rspotify'
require 'youtube_search'
require 'yourub'

YT = Yourub::Client.new({ developer_key: ENV['YOUTUBE_API_KEY'] })

class Utify
  include Version

  def searchFromFile(filepath)
    tracks = IO.readlines(filepath)
    tracks.each do | track |
      self.searchFromURI(track)
    end
  end

  def searchFromURI(track)
    title = self.get_track(track)
    YT.search(query: title,  max_results: 1) do |v|
      video_id = v['id']
      self.download_track(title, "https://www.youtube.com/watch?v=#{video_id}")
    end

  end

  def get_track(uri)
    id = uri.strip.split('/').last
    track = RSpotify::Track.find(id)
    "#{track.name} - #{track.artists[0].name}"
  end

  def download_track(title, clip)
    puts "Downloading #{title} ..."
    cmd = `youtube-dl --no-progress --extract-audio --audio-format=mp3  --output="#{title}.mp3" #{clip} > /dev/null`
    system(cmd)
  end

end
