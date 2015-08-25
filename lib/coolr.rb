require "httparty"


module Coolr
  include HTTParty
  base_uri 'http://bullseyeapi-dev.elasticbeanstalk.com'
 @response = {headers: {
                'X-Bullseye-Auth' => '13gmLhFd4L',
                'Accept' => 'application/json'}}


  def self.feed
    get("/v1/u/feed", @response).parsed_response['items']
  end

  def self.find_post(post_id)
    get("/v1/posts/#{post_id}", @response).parsed_response
  end

  def self.find_post_comment(post_id)
    get("/v1/posts/#{post_id}/comments", @response).parsed_response
  end

  def self.find_post_likes(post_id)
    get("/v1/posts/#{post_id}/likes", @response).parsed_response
  end

  def self.create_comment(post_id, text)
    @response = {
        :headers => { 'X-Bullseye-Auth' => '13gmLhFd4L', 'Content-Type' => 'application/json', 'Accept' => 'application/json'},
        :body => {'text' => text}.to_json
    }
    post("/v1/posts/#{post_id}/comments", @response)
  end

  def self.create_post(type, text)
    @response = {
        :headers => { 'X-Bullseye-Auth' => '13gmLhFd4L', 'Content-Type' => 'application/json', 'Accept' => 'application/json'},
        :body => {'type' => type,'text' => text}.to_json
    }
    post("/v1/posts", @response)
  end

end


# Coolr.find_post('z2JnmAkgT1')
# Coolr.create_comment('z2JnmAkgT1', "hi")
# Coolr.create_post('text', 'hello')
