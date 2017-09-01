require 'net/http'

class Request
  
  def getBody(length)
    uri = URI('https://api.auraventi.com/forecast/weather/temperature/findhorn')
    params = length
    uri.query = URI.encode_www_form(params)

    # Creates a new http object
    # Connects to server
    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      request['Accept'] = "application/json"
      request['Authorization'] = "Basic dXB1bDota0FHYyNjWCZkdFRYWnR1JQ=="

      res = http.request(request)
      # puts res.code
      resBody = res.body if res.is_a?(Net::HTTPSuccess)

      open('response.txt', 'w') do |f|
        f.puts resBody
      end
      # return res.body
    end
  end

end

Request.new().getBody({:length => 4});