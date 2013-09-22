require 'net/http'
require 'uri'


url = URI.parse(url)

Net::HTTP.start(url.host, url.port) do |http|       
        f = open(filename, "w")
        begin
            http.request_get(url) do |resp|              
            resp.read_body do |segment|
                f.write(segment)                 
            end
            end
        ensure
            f.close()
        end     
    end
