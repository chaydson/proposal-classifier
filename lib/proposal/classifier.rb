require "http"

module Proposal
  module Classifier
    class Model
      @@base_url = "http://0.0.0.0"  # Default base URL

      def self.base_url
        @@base_url.dup
      end

      def self.base_url=(new_url)
        @@base_url = new_url.dup
      end

      def self.init()
        response_get = HTTP.get(@@base_url.dup)
        formatted_get_response = response_get.parse
        return formatted_get_response
      end

      def self.predict(input_text)
        response_post = HTTP.post("#{@@base_url.dup}/predict", :json => { :text => input_text })
        formatted_post_response = response_post.parse
        return formatted_post_response
      end
    end
  end
end
