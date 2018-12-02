# Use Homebrew to install a package.
def brew_install(package)
  system("brew install #{package}")
end

def open_url(url)
  puts "Opening #{url}."
  system("open '#{url}'")
end
