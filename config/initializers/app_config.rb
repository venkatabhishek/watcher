require 'json'

# TODO: make api request instead of reading from hard-coded json

# json file of genre names+ids into hash
GENRE = JSON.parse(File.read(File.join(Rails.root, 'config', 'genre.json')))