require 'yaml'
require 'configurables'

BOOTSTRAPPER_YML = YAML.load_file('bootstrapper.yml')

puts BOOTSTRAPPER_YML.inspect

config = BOOTSTRAPPER_YML["bootstrapper"]["config"]

