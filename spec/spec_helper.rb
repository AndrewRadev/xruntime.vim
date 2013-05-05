require 'vimrunner'
require 'vimrunner/rspec'
require_relative './support/files'
require_relative './support/vim'

RSpec.configure do |config|
  config.include Support::Files
end

plugin_path = File.expand_path('.')

Vimrunner::RSpec.configure do |config|
  config.reuse_server = true

  config.start_vim do
    vim = Vimrunner.start_gvim

    vim.add_plugin(plugin_path, 'plugin/xruntime.vim')
    Support::Vim.define_extra_methods(vim)
    vim
  end
end
