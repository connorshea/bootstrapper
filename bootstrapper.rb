require 'yaml'
require_relative 'src/configurables'
require_relative 'src/utils'

BOOTSTRAPPER_YML = YAML.load_file('bootstrapper.yml')
config = BOOTSTRAPPER_YML["bootstrapper"]["config"]

# Quit early if Homebrew config is set to false.
unless config["homebrew"]
  puts "You must install Homebrew for this script to work."
  exit()
end

# Open requested URLs in the browser.
urls = BOOTSTRAPPER_YML["bootstrapper"]["open_urls"]
urls.each do |url|
  open_url(url)
end

# Set up relevant directories for Homebrew installation, if needed.
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
  install_homebrew()
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


