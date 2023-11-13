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
        response_get = HTTP.get(@@base_url).body.to_s
        return response_get
      end

      def self.predict(input_text)
        response_post = HTTP.post("#{@@base_url}/predict", :json => { :text => input_text }).body.to_s
        return response_post
      end
    end
  end
end
