require 'logger'
load 'lib/logwrapper/directory_handler.rb'

  # Store log files in same folder
  # Initialize new log files, but remember which ones 
  # Remove - pass thru the name now - Generate name base on method / class / size of class
  # Access said log files

class MultiFileLogger
  attr_accessor :logger
  
  def logger(the_method)
    @logger[the_method] ||= log_handler(the_method)
  end

  def self.log_handler(the_method)
    log_name = FileNamer.discover_log_name(the_method)
    file = File.join('log', "#{log_name}.log")
    check_file_header(file)  
    log = Logger.new(file)  # This must always be at the end
    # TODO - need to close these logs sometime - but only when unused
  end
  
  def self.check_file_header(file)
    File.open(file, "a+") do |f|
      f << file if f.readlines.count < 2
    end
  end
  
  def write_log(log, message)
    log.info(message) # TODO - writes but doesn't check #logger
  end
end

class FileNamer
  # Requires format Module::Classname.method(:name) & then it derives file size
  # TODO - integrate this back to the test_run method in other gem
  # TODO - ripper or ruby parse this for size of file without comments counting
  def self.discover_log_name(the_method)
    class_name = the_method.class.to_s.split(" ").last.split('.').first
    class_size = File.size(the_method.source_location.first)
    "#{class_name}_#{the_method}_#{class_size}"
  end
end