require 'net/http'

class Request  
  def getBody(predictionType, location, queryParms)
    uri = URI("https://api.auraventi.com/forecast/weather/#{predictionType}/#{location}")
    if(queryParms!= nil)
      uri.query = URI.encode_www_form(queryParms)
    end

    # Creates a new http object
    # Connects to server
    resBody = ""
    resCode = 0
    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      request['Accept'] = "application/json"
      request['Authorization'] = "Basic dXB1bDota0FHYyNjWCZkdFRYWnR1JQ=="

      res = http.request(request)
      resBody = res.body if res.is_a?(Net::HTTPSuccess)
      resCode = res.code

      # Ends connection to server
      http.finish
    end
    puts "Server returned HTTP status #{resCode}"
    return resBody
  end
end