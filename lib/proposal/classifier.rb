# frozen_string_literal: false

require "http"

module Proposal
  module Classifier
    class Model
      @@base_url = "http://0.0.0.0"  # Default base URL

      def self.base_url
        @@base_url
      end

      def self.base_url=(new_url)
        @@base_url = new_url
      end

      def self.init()
        response_get = HTTP.get(@@base_url).to_s.dup
        formatted_get_response = response_get.parse
        return formatted_get_response
      end

      def self.predict(input_text)
        response_post = HTTP.post("#{@@base_url}/predict", :json => { :text => input_text }).to_s.dup
        formatted_post_response = response_post.parse
        return formatted_post_response
      end
    end
  end
end
