require 'fileutils'

  #### Revised listing ####
    # directory structure handling
    # log file naming
    # header information handling
    # file open / close / write handling
    
      ### philospy & scope ###
    # all logs should be in the log folder 
    # all this gems logs should be isolated from normal log file
    # all logs for the same class should be in same dir or archive dir in that same dir
    # subsequent methods should have their own directory
    # all log names should be a finger print 
    # finger print should probably be class?/method/date/size etc ...
    # semantic versioning in log header could be a user way of comparing logs 
   ## Handling
      # side effects returning report of location / success / raise errors

class DirectoryHandler
  def self.create_dir(dir_name, *args)
    FileUtils.mkdir_p File.join('log', dir_name)
  end
end


### was env option detection important later
  # @folder = args.first[:folder] 
  # @root = args.first[:the_root] || rails_defined || ruby_defined

  # def from_args
  #   args.first[:the_root]
  # end
  
  # def rails_defined
  #   Rails.root if defined?(Rails)
  # end
  
  # def ruby_defined
  #   Dir.getwd
  # end
###
  
  
  ## TODO - write a method to put logname at top of file
  #   def self.folder_handler(dir_name = 'benchmarks', log_path = 'log')
  ## orignal version
  ## FileUtils.mkdir_p File.join(log_path, dir_name)
  ## path = File.join(log_path, dir_name)
  ## if Dir.exists? path
  ##   path
  ## else
  ##   FileUtils.mkdir_p path 
  ## end
  #   end
