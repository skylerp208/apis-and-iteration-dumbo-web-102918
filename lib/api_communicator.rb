require 'rest-client'
require 'json'
require 'pry'
require_relative "../lib/command_line_interface.rb"




def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

   character_array = response_hash["results"][0..-1].select do |item|
        item["name"] == character
   end

  films = character_array[0]['films']


     var = films.collect do |url|
       response = RestClient.get(url)
       film_hash = JSON.parse(response)
     end
   end



def print_movies(films_hash)
  title = films_hash.collect do |hash|
    puts "#{hash["episode_id"]}, #{hash["title"]}"
  end

end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
