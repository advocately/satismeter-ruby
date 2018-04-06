module Satismeter
  class User < Resource
    self.path = "/users"
    self.record_key = :users
    attr_accessor :meta

    include Operations::All
    include Operations::Retrieve
  end
end
