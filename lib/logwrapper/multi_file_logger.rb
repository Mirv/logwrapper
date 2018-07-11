  # Store log files in same folder
  # Initialize new log files, but remember which ones 
  # Generate name base on method / class / size of class
  # Access said log files

class MultiFileLogger
  attr_accessor :logger
  
  def logger(the_method)
    @logger[the_method] ||= log_handler(the_method)
  end
  
  def log_handler(the_method)
    log_name = discover_log_name(the_method)
    file = File.join(@the_root, 'log', @folder, "#{log_name}.log")
    if File.exists? file
      log = Logger.new(file)
    else
      log = Logger.new(file)
      log.info(prep_header)
    end
  end

  # Requires format Module::Classname.method(:name) & then it derives file size
  # TODO - integrate this back to the test_run method in other gem
  # TODO - ripper or ruby parse this for size of file without comments counting
  def discover_log_name(the_method)
    class_name = the_method.class.to_s.split(" ").last.split('.').first
    class_size = File.size(the_method.source_location.first)
    "#{class_name}_#{the_method}_#{class_size}"
  end
  
  def write_log(log, message)
    log.info(message) # TODO - writes but doesn't check #logger
  end
  
  def prep_header
    models = ARDiscovery.find_models(nil, nil)
    counters = models.sum { |x| x.column_names.count }
    return "models: #{models.count}, columns: #{counters}"
  end

  

end
