$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'uuid'
require 'endlist/config'
require 'endlist/http'
require 'endlist/list'
require 'endlist/client'

module Endlist; end

