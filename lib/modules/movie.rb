require 'rest-client'
require 'json'

module Movie
    @@base_url = Rails.configuration.tmbd_base_url
    @@image_url = Rails.configuration.tmbd_image_url
    @@api_key = Rails.application.credentials.dig(:tmbd_key)

    def popular
        begin
            response = RestClient.get("#{@@base_url}/movie/popular",
                params: {api_key: @@api_key, language: 'en-US', region: 'US', page: 1})
            if response.code == 200
                parsed = JSON.parse(response.body)
                # format image urls
                parsed['results'].map{|m| m['poster_path'] = "#{@@image_url}/w500/#{m['poster_path']}"}
                # format dates
                parsed['results'].map{|m| m['release_date'] = m['release_date'][0..3]}
                #format genres
                parsed['results'].map{|m|
                    m['genres'] = m['genre_ids'].map{|id| GENRE[id.to_s]}.join(" | ")
                }
                return parsed['results']
            else
                return []
            end
        rescue RestClient::ExceptionWithResponse => e
            return []
        end
    end

    def genres
        return GENRE.values[0..3]
    end

end