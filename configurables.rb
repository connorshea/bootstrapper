require 'net/http'
require 'uri'
require_relative 'utils'

# Install Homebrew
def homebrew
  # Check to make sure Homebrew isn't installed already.
  if !system("command -v brew >/dev/null")
    puts "Installing Homebrew..."
    
    homebrew_uri = URI.parse("https://raw.githubusercontent.com/Homebrew/install/master/install")
    response = Net::HTTP.get_response(homebrew_uri)
    
    puts response.code
    puts response.body
  else
    puts "Homebrew is already installed."
  end
end

# Install Ruby including Bundler and RubyGems
def ruby
  puts "Updating RubyGems to latest..."
  system("gem update --system")

  puts "Installing Bundler..."
  gem_install_or_update("bundler")
end

# Install Postgres
def postgres
  puts "Installation of Postgres is not built yet."
end

# Install MySQL
def mysql
  puts "Installation of MySQL is not built yet."
end

# Install git
def git
  puts "Installation of Git is not built yet."
end

# Install rbenv
def rbenv
  puts "Installation of rbenv is not built yet."
end

# Install rvm
def rvm
  puts "Installation of rvm (ruby version manager) is not built yet."
end
