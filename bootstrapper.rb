require 'yaml'
require_relative 'configurables'
require_relative 'utils'

BOOTSTRAPPER_YML = YAML.load_file('bootstrapper.yml')

puts BOOTSTRAPPER_YML.inspect

config = BOOTSTRAPPER_YML["bootstrapper"]["config"]

puts config

HOMEBREW_PREFIX = '/usr/local'

if Dir.exist?(HOMEBREW_PREFIX)
  unless File.readable?(HOMEBREW_PREFIX)
    system("sudo chown -R '#{ENV['LOGNAME']}:admin' /usr/local")
  end
else 
  system("sudo mkdir '#{HOMEBREW_PREFIX}'")
  system("sudo chflags norestricted '#{HOMEBREW_PREFIX}'")
  system("sudo chown -R '#{ENV['LOGNAME']}:admin' '#{HOMEBREW_PREFIX}'")
end

if config["homebrew"]
  homebrew()
else
  puts "You must install Homebrew for this script to work."
  exit()
end

if config["ruby"]
  ruby()
end


