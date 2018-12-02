# Bootstrapper

**NOTE**: This script been tested (without problems on a new 2018 MacBook Pro running Mojave), but not extensively. Mojave is the only version I've tested it on, past/future versions may work but there are no guarantees.

The goal of this Ruby script is to take a simple YAML configuration file and set up all the utilities one may need.

The idea comes from thoughtbot's [laptop](https://github.com/thoughtbot/laptop) script, which I wanted to make more configurable.

## Usage

1. Open the Terminal.
2. Try to run `git help`, if the Xcode Command Line Tools aren't installed the command will fail and give you a dialog which will allow you to easily install the command line tools. Otherwise it'll just show some help info.
3. Move to a directory you'd like to clone this git repository into.
4. `git clone https://github.com/connorshea/bootstrapper.git`: Clone this repository with git
5. `cd bootstrapper`: Move to the bootstrapper directory you just created
6. Configure your `bootstrapper.yml` file (more info in the `bootstrapper.yml` section below.)
7. `ruby bootstrapper.rb`: You may need to run the script as sudo for it to work.

The script will have a few inputs for you to respond to, such as your git username and email.

## `bootstrapper.yml`

The `bootstrapper.yml` file is used to configure the Bootstrapper script. It can be modified to install certain dependencies, run arbitrary commands, etc.

### Examples

This is an example of how a `bootstrapper.yml` file looks:

```yml
bootstrapper:
  # Configure what the script should set up for you.
  # Most of these are just installed from Homebrew.
  config:
    # homebrew can't actually be set to false or everything else will break, sorry!
    homebrew: true
    ruby: true
    postgres: true
    mysql: true
    git: true
    rbenv: true
    vim: true
  # Open these URLs before doing anything else.
  # This is so you can install applications like a text editor, browser, etc.
  # while you wait for brew to install everything.
  open_urls:
    # VS Code
    - 'https://code.visualstudio.com'
  # Homebrew packages that should be installed, this is for installing things
  # the script doesn't already support.
  # Leave this empty if you don't want to install any of it.
  brew_install:
    - 'cowsay'
    - 'tree'
  # Arbitrary commands to run after setting up the script. Be careful with this!
  after_script:
    - 'cowsay test'
    - 'tree .'
```

You can opt to not install any extra packages or run any extra bash commands by leaving those sections empty:

```yml
bootstrapper:
  # Configure what the script should set up for you.
  # Most of these are just installed from Homebrew.
  config:
    # homebrew can't actually be set to false or everything else will break, sorry!
    homebrew: true
    postgres: true
    mysql: false
    git: false
    rbenv: false
    vim: false
  # Open these URLs before doing anything else.
  # This is so you can install applications like a text editor, browser, etc.
  # while you wait for brew to install everything.
  open_urls:
  # Homebrew packages that should be installed, this is for installing things
  # the script doesn't already support.
  # Leave this empty if you don't want to install any of it.
  brew_install:
  # Arbitrary commands to run after setting up the script. Be careful with this!
  # Leave this empty if you don't want to run any extra commands.
  after_script:
```

See [examples/](examples/) for more example YAML files.
