# Install or update a Ruby gem.
def gem_install_or_update(gem)
  if system("gem list #{gem} --installed > /dev/null")
    system("gem update #{gem}")
  else
    system("gem install #{gem}")
  end
end
