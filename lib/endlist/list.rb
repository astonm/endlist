module Endlist
  class List < Array

    class << self
      def find(key)
        list = Endlist::List.[](*Endlist::HTTP.fetch(key))
        list.key = key
        list.to_a
      end
    end


    attr_accessor :key


    def saved?
      !!key
    end

    def save
      self.key = HTTP.store self unless saved?
    end
  end
end
