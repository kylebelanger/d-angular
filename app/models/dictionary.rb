require 'httparty'

class JsonpParser < HTTParty::Parser
  SupportedFormats = {"text/javascript" => :jsonp}

  def jsonp
    JSON.load(body[2..-11], nil)
  end

end

class Dictionary
  include HTTParty

  parser JsonpParser

  def self.define(word)
    get "http://www.google.com/dictionary/json?callback=a&sl=en&tl=en&q=#{word}"
  end

end