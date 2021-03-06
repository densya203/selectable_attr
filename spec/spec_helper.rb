require 'rspec/core'
require 'rspec'
require 'rspec/its'

Dir['./spec/support/**/*.rb'].map {|f| require f}

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require File.join(File.dirname(__FILE__), '..', 'init')
