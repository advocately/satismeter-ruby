module Satismeter
  class SurveyResponse < Resource
    self.path = "/responses"
    self.record_key = :responses
    attr_accessor :meta

    include Operations::All
    include Operations::Retrieve
  end
end
