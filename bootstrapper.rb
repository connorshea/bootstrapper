require 'yaml'
require_relative 'configurables'
require_relative 'utils'

BOOTSTRAPPER_YML = YAML.load_file('bootstrapper.yml')

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

config = BOOTSTRAPPER_YML["bootstrapper"]["config"]

if config["homebrew"]
  install_homebrew()
else
  puts "You must install Homebrew for this script to work."
  exit()
end

if config["ruby"]
  install_ruby()
end

if config["postgres"]
  install_postgres()
end

if config["mysql"]
  install_mysql()
end  

if config["git"]
  install_git()
end  

if config["rbenv"]
  install_rbenv()
end  

if config["vim"]
  install_vim()
end

puts
puts "Installing extra Homebrew packages..."

# Install any extra Homebrew packages the user requests
homebrew_packages = BOOTSTRAPPER_YML["bootstrapper"]["brew_install"]
homebrew_packages.each do |package|
  brew_install(package)
end

puts
puts "Running specified after_script commands..."

# Run the scripts the user specifies.
after_script = BOOTSTRAPPER_YML["bootstrapper"]["after_script"]
after_script.each do |command|
  puts
  puts "Running command: \"#{command}\""
  system(command)
end


