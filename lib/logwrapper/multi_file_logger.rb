require 'logger'
load 'lib/logwrapper/directory_handler.rb'

  # Store log files in same folder
  # Initialize new log files, but remember which ones 
  # Generate name base on method / class / size of class
  # Access said log files

class MultiFileLogger
  attr_accessor :logger
  
  def logger(the_method)
    @logger[the_method] ||= log_handler(the_method)
  end
  
  # def log_handler(the_method)
  #   log_name = discover_log_name(the_method)
  #   file = File.join(@the_root, 'log', @folder, "#{log_name}.log")
  #   if File.exists? file
  #     log = Logger.new(file)
  #   else
  #     log = Logger.new(file)
  #     log.info(prep_header)
  #   end
  # end
  
  def self.log_handler(the_method)
    the_method = MultiFileLogger.method(:logger_test)
    log_name = FileNamer.discover_log_name(the_method)
    file = File.join('log', "#{log_name}.log")
    log = Logger.new(file)
    check_file_header(file)  
    # TODO - need to close these logs sometime
    #
  end
  
  def self.check_file_header(file)
    f = File.open(file, File::RDWR)
    f << file if f.readlines.count < 2
    f.close
  end
  
  # def self.logger_test()
  #   name = File.join('log', 'benchmarks', 'test3232')
  #   log = Logger.new(name)
  #   count = File.open(name).readlines.count
  #   log.info(name)if count < 2
  # end
  
  # def log_handler(the_method)
  #   log = Logger.new(the_method)
  #   if File.size(log) < 1
  #     log.info(prep_header) 
  #     puts "FIRING THINGS!"
  #   end
  # end

  def write_log(log, message)
    log.info(message) # TODO - writes but doesn't check #logger
  end

  # TODO - this part goes back to the test_run class or elsewhere  
  # def self.prep_header
    # models = ARDiscovery.find_models(nil, nil)
    # counters = models.sum { |x| x.column_names.count }
    # return "models: #{models.count}, columns: #{counters}"
  # end
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