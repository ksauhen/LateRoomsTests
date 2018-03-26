require 'rest-client'

class AutoCompleteApi

  def base_url
    'https://autocomplete.laterooms.com'
  end

  def call_for(search_for)
    RestClient.get(base_url + "/?q=#{search_for}&entityType=HOTEL&entityType=DEST&entityType=POI&entityType=AIR&entityType=TRAIN&entityType=EVENT")
  end

  def get_text_captions(api_results)
    parsed = JSON.parse(api_results)
    parsed.map{|result| result['text']}
  end
end