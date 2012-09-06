module Endlist
  class Client

    include Endlist::Config

    def initialize(opts={})
      self.client_id  = opts[:client_id]
      self.secret     = opts[:secret]
    end

    def find(key)
      Endlist::List.find(key)
    end

    def save(list)
      Endlist::List.[](*list).save
    end
  end
end
