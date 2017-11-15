class Video
  require "json"
  require "net/http"

  def get_title
    url = "https://jon.endpoint.com/youtube-popular-20121222.json"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    title = data['feed']['entry'].max { |a, b| a['yt$statistics']['viewCount'].to_i <=> b['yt$statistics']['viewCount'].to_i }
    title['title'].values
  end
end

a = Video.new
puts a.get_title