require 'net/http'
require 'uri'


urlBase = URI.parse('http://translate.google.com')

allList = [
["ac.mp3","/translate_tts?tl=en&q='a%20c'"],
["acura.mp3","/translate_tts?tl=en&q='acura'"]
]

for urlArray in allList
Net::HTTP.start(urlBase.host, urlBase.port) do |http|       
        f = open(urlArray[0], "w")
        begin
            http.request_get(urlArray[1]) do |resp|              
            resp.read_body do |segment|
                f.write(segment)                 
            end
            end
        ensure
            f.close()
        end     
    end
end
