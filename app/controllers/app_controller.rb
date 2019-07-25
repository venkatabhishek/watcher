require 'rest-client'
require 'json'

class AppController < ApplicationController
  def index
    @movies = []
    begin
        response = RestClient.get("#{Rails.configuration.tmbd_base_url}/movie/popular",
            params: {api_key: Rails.application.credentials.dig(:tmbd_key), language: 'en-US', region: 'US', page: 1})
        if response.code == 200
            parsed = JSON.parse(response.body)
            @movies = parsed['results']
        end
    rescue RestClient::ExceptionWithResponse => e
        puts e.response
    end

  end
end
