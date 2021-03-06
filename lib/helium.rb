require 'observer'
require 'erb'
require 'yaml'
require 'fileutils'
require 'find'

require 'grit'
require 'jake'
require 'packr'

module Helium
  
  ROOT          = File.expand_path(File.dirname(__FILE__))
  TEMPLATES     = File.join(ROOT, '..', 'templates')
  ERB_EXT       = '.erb'
  JS_CONFIG_TEMPLATE = File.join(TEMPLATES, 'packages.js.erb')
  
  CONFIG_FILE   = 'deploy.yml'
  REPOS         = 'repos'
  STATIC        = 'static'
  PACKAGES      = 'helium-src.js'
  PACKAGES_MIN  = 'helium.js'
  WEB_ROOT      = 'js'
  
  COMMIT        = /^[0-9a-f]{40}$/
  GIT           = '.git'
  HEAD          = 'HEAD'
  HEAD_LIST     = 'heads.yml'
  
  JS_CLASS      = 'js.class'
  LOADER_FILE   = 'loader.js'
  JAKE_FILE     = Jake::CONFIG_FILE
  
  SEP  = File::SEPARATOR
  BYTE = 1024.0
  
  ERB_TRIM_MODE = '-'
  
  autoload :Configurable, File.join(ROOT, 'helium', 'configurable')
  autoload :Deployer,     File.join(ROOT, 'helium', 'deployer')
  autoload :Generator,    File.join(ROOT, 'helium', 'generator')
  autoload :Logger,       File.join(ROOT, 'helium', 'logger')
  autoload :Trie,         File.join(ROOT, 'helium', 'trie')
  autoload :Web,          File.join(ROOT, 'helium', 'web')
  
  def self.generate(template, dir, options = {})
    Generator.new(template, dir, options).run!
  end
  
end
