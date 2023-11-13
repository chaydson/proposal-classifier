# frozen_string_literal: false

require "http"

module Proposal
  module Classifier
    class Model
      @base_url = "http://0.0.0.0"  # Default base URL

      def self.base_url
        @base_url.clone
      end

      def self.base_url=(new_url)
        @base_url = new_url.clone
      end

      def self.init()
        response_get = HTTP.get(@base_url.clone).body.to_s.clone
        return response_get.clone
      end

      def self.predict(input_text)
        response_post = HTTP.post("#{@base_url.clone}/predict", :json => { :text => input_text }).body.to_s.clone
        return response_post.clone
      end
    end
  end
end
