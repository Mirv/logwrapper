# Production require instead of load 
# -- TODO - be sure to change require to load & drop the '.rb' from end
# require "logwrapper/version"
# require "logwrapper/multi_file_logger"

load 'lib/logwrapper/multi_file_logger.rb' unless defined? MultiFileLogger
load 'lib/logwrapper/version.rb' unless defined? Logwrapper

module Logwrapper
  # Your code goes here...
  # MultiFileLogger.new
  #
  class Logwrapper
    
    def self.hi
      # puts "Logwrapper Main file"
      "Logwrapper Main file"
    end
    
    def bye
      puts "Bye"
      "Bye"
    end
  end
end

