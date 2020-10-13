# # require "what_should_i_eat/version"
require 'what_should_i_eat:printing'
require 'http'
require 'JSON'

module WhatShouldIEat
  
  def WhatShouldIEat.recipe_get

    # puts "go ahead, ask me: \"what should i eat today?\""

    result = HTTP.get('https://www.edamam.com/search?type=Feeds').to_s
    recipes = JSON.parse(result)
    recipe_name = recipes.first['items'].first['label']
    recipe_url = recipes.first['items'].first['url']

    Printing.print recipe_name, recipe_url

  end

end
