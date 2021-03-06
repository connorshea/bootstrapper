require 'net/http'
require 'uri'
require_relative 'utils'

# Install Homebrew
def install_homebrew
  # Check to make sure Homebrew isn't installed already.
  if !system("command -v brew >/dev/null")
    puts "Installing Homebrew..."
    system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
  else
    puts "Homebrew is already installed."
  end
end

# Install Postgres
def install_postgres
  puts "Installing postgres..."
  brew_install("postgresql")
end

# Install MySQL
def install_mysql
  puts "Installing MySQL..."
  brew_install("mysql")
end

# Install git
def install_git
  puts "Installing Git..."
  brew_install("git")

  # Get the name and email the user wants to use with git.
  puts "Please enter the name you want to use with Git (e.g. John Smith, Jane Smith, Conan the Annihilator etc.)"
  git_name = gets.chomp
  puts "Please enter the email you want to use with Git (e.g. john.smith@gmail.com, etc.)"
  git_email = gets.chomp

  # Setting up the git config.
  system("git config --global user.name '#{git_name}'")
  system("git config --global user.email '#{git_email}'")
end

# Install rbenv
def install_rbenv
  puts "Installing rbenv..."
  brew_install("rbenv")
  system("rbenv init")
end

# Install vim
def install_vim
  puts "Installing vim..."
  brew_install("vim")
end
