require "test_helper"
load "../logwrapper/lib/logwrapper/multi_file_logger.rb"
load "../logwrapper/lib/logwrapper/directory_handler.rb"

class LogwrapperTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Logwrapper::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
  
  def test_returns_greeting
    assert Logwrapper::Logwrapper.hi, "Logwrapper Main file!"
  end

  def test_returns_logfile_if_exists
  end
  
  def test_log_handler_rails
  end
  
  def test_log_handler_ruby
  end
  
  def test_log_handler_args
  end
  
  def test_creates_log_file_if_not_exists
    blah = DirectoryHandler.create_dir('benchmarks')  # setup directory for the files
    # create the file in question
    # return file to be used by other obj
  end

  def test_creates_directory_if_not_existing
    directory = 'tmp/benchmarks'
    blah = DirectoryHandler.create_dir(directory) 
    directory = 'log/' << directory
    assert Dir.exists? "#{directory}"
    FileUtils.remove_dir "log/tmp"
  end
  
  def test_creates_default_directory
    DirectoryHandler.create_dir('benchmarks')
    assert Dir.exists? 'log/benchmarks'
  end  
  
  def test_create_directory_nested_inside_and_delete
    # TODO - go back & figure out FakeFS for testing actual creation regardless of if file exists or not
  end
  
  def test_writes_to_logfile
  end

  
end
