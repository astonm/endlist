require 'typhoeus'
require 'json'

module Endlist
  module HTTP
    class << self

      def store(list)
        invalid_storage_type!(list.classname) unless list.class <= Array

        response = Typhoeus::Request.post(
          "http://list.endless.fm/api", 
          :body => {
            :list => list.to_json, 
            :access => 'list.endlist.fm'
          }
        )

        invalid_response!(response) unless success? response

        JSON.parse(response.body)['key']
      end

      def fetch(key)
        response = Typhoeus::Request.get(
          "http://list.endless.fm/api/#{key}", 
          :params => {
            :access => 'list.endlist.fm'
          }
        )
        
        invalid_response!(response) unless success? response

        JSON.parse(response.body)
      end


    private


      def invalid_storage_type!(class_name)
        raise YouBlewIt.new("#{class_name} can not be stored in endlist")
      end

      def invalid_response!(response)
        raise YouBlewIt.new("the endlist API returned a #{response.code}")
      end

      def success?(response)
        (200..299).include? response.code
      end

    end


    class YouBlewIt < RuntimeError
      attr_accessor :message

      def initialize(message='')
        self.message = message
      end
                  
      def to_s
        "there was an error communcating with the endlist API: \"#{message}\""
      end
    end


  end
end
