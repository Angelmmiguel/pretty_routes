source 'https://rubygems.org'

rails_version = ENV['RAILS_VERSION'] || 'default'

rails = case rails_version
        when 'master'
          { github: 'rails/rails' }
        when 'default'
          '>= 4.2.5'
        else
          '~> #{rails_version}'
        end

gem 'rails', rails

gemspec
