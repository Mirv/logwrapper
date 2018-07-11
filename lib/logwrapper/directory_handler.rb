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
