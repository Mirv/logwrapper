
  # Store log files in same folder
  # Initialize new log files, but remember which ones 
  # Generate name base on method / class / size of class
  # Access said log files

class MultiFileLogger
  attr_accessor :logger
  
  # Accepts new directory name in :folder 
  def initialize(*args)
    @folder = args.first[:folder] 
    folder_handler(@folder)   # create folder if necessary
    prep_header
    @logger = {}
  end

  def logger(the_class, the_method)
    @logger[the_class] ||= log_handler(the_class, the_method)
  end
  
  def log_handler(the_class, the_method)
    log_name = discover_log_name(the_class, the_method)
    file = File.join(Rails.root, 'log', @folder, "#{log_name}.log")
    if File.exists? file
      log = Logger.new(file)
    else
      log = Logger.new(file)
      log.info(prep_header)
    end
  end

  # TODO - write a method to put logname at top of file
  def folder_handler(dir_name = 'benchmarks')
    path = File.join(Rails.root, 'log', dir_name)
    FileUtils.mkdir_p path unless Dir.exists? path
  end
  
  # Requires the class name, method name & then it derives file size
  def discover_log_name(the_class, the_method)
    class_name = the_class.to_s.split(" ").last.split('.').first
    class_size = File.size(the_class.source_location.first)
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
