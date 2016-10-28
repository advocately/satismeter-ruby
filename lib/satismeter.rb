require 'net/https'
require 'uri'
require 'cgi'
require 'multi_json'
require 'set'
require 'thread'

require 'satismeter/version'
require 'satismeter/utils'
require 'satismeter/json'

require 'satismeter/enumerable_resource_collection'
require 'satismeter/resource'
require 'satismeter/operations/all'
require 'satismeter/operations/retrieve'
require 'satismeter/resources/survey_response'

require 'satismeter/errors'
require 'satismeter/http_response'
require 'satismeter/http_adapter'
require 'satismeter/client'

module Satismeter
  @mutex = Mutex.new

  class << self
    attr_accessor :api_key, :api_base_url, :http_adapter, :app_id
    attr_writer :shared_client

    def shared_client
      @mutex.synchronize do
        @shared_client ||= Client.new(api_key: api_key, app_id: app_id, api_base_url: api_base_url, http_adapter: http_adapter)
      end
    end
  end
end
