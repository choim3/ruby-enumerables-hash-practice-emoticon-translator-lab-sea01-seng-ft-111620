# require modules here
require 'pry'
require "yaml"

def load_library(file_name)
  file_list = YAML.load_file(file_name)
  emoji_hash= {}
  
  file_list.each do |meaning, emojis|
    
    emoji_hash ["#{meaning}"] = {:english => emojis[0]}
    # emoji_hash ["emoticon_symbol"][emojis[0]] = emojis[1]
    
  end
  binding.pry
end

def get_japanese_emoticon(file_name, emoji)
  
  file_list = load_library(file_name)
    if file_list["emoticon_symbol"][emoji]
      return file_list["emoticon_symbol"][emoji]
    else 
      p "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file_name, emoji)
  file_list = load_library(file_name)
    if file_list["emoticon_meaning"][emoji]
     return file_list["emoticon_meaning"][emoji]
   else
     p "Sorry, that emoticon was not found"
    end 
end