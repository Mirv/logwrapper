# Production require instead of load 
# -- TODO - be sure to change require to load & drop the '.rb' from end
# require "logwrapper/version"
# require "logwrapper/multi_file_logger"

load 'lib/logwrapper/multi_file_logger.rb'
load 'lib/logwrapper/version.rb'

module Logwrapper
  # Your code goes here...
  # MultiFileLogger.new
  #
  def self.hi
    puts "Logwrapper Main file"
  end
  
  def bye
    puts "Bye"
  end
  
end
