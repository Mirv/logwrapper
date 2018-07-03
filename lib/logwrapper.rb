require "logwrapper/version"
require "logwrapper/multi_file_logger"

module Logwrapper
  include MultiFileLogger
  # Your code goes here...
  # MultiFileLogger.new
  #
  def self.hi
    puts "Logwrapper Main file"
  end
  
end
