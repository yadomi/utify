# Utify

TODO: Write a gem description

## Prerequisites

To use Utify you need some non-ruby apps:

  - youtube-dl
  - ffmpeg

On OSX you can install them with `brew` and on Ubuntu with `apt-get`.

## Installation

Since **Utify** is not yet on RubyGems, you can use it from the repo:

```

git clone https://github.com/yadomi/utify && cd utify

bundle install

./bin/utify

```

## Usage

```

YOUTUBE_API_KEY=<your_youtube_api_key> ./bin/utify playlist.txt ~/Downloads/

```