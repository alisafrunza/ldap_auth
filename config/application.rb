require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module LdapAuth
  class Application < Rails::Application
  	config.eager_load_paths += %W(#{config.root}/lib)
  end
end
