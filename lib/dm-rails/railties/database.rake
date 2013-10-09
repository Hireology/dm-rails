require 'dm-rails/setup'
require 'dm-rails/storage'

namespace :db do

  namespace :sessions do
    desc "Creates the sessions table for DataMapperStore"
    task :create do
      require 'dm-rails/session_store'
      Rails::DataMapper::SessionStore::Session.auto_migrate!
      database = Rails::DataMapper.configuration.repositories[Rails.env]['database']
      puts "Created '#{database}.sessions'"
    end

    desc "Clear the sessions table for DataMapperStore"
    task :clear do
      require 'dm-rails/session_store'
      Rails::DataMapper::SessionStore::Session.destroy!
      database = Rails::DataMapper.configuration.repositories[Rails.env]['database']
      puts "Deleted entries from '#{database}.sessions'"
    end
  end

end
