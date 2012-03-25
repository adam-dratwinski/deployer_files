module Deployer
  module Generators
    class FilesGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      attr_accessor :app_name, :app_path, :app_user, :application_host, :server_host, :git_path, :git_branch

      def run_files_generator
        default_app_name = Rails.application.class.parent_name.underscore

        self.app_name = ask("Remote application name (#{default_app_name}):") 
        self.app_name = default_app_name if self.app_name.blank?

        self.app_user = ask("Remote application deployer name:")

        self.app_path = ask("Remote application path:")

        self.server_host = ask("Remote server host:")
        self.application_host = ask("Application host:")

        self.git_path = ask("Remote git path:")
        self.git_branch = ask("Remote git branch: (master)")
        self.git_branch = "master" if self.git_branch.blank?

        puts "You have provided:"
        puts ""
        puts "App Name:          #{app_name}"
        puts "App User:          #{app_user}"
        puts "App Path:          #{app_path}"
        puts "Server Host:       #{server_host}"
        puts "Application Host:  #{application_host}"
        puts "Git Path:          #{git_path}"
        puts "Git Branch:        #{git_branch}"
        puts ""
        if yes?("Is this ok?") 
          template "deploy.rb", "config/deploy.rb"
          template "nginx.conf", "config/nginx.conf"
          template "unicorn.rb", "config/unicorn.rb"
          template "unicorn_init.sh", "config/unicorn_init.sh"
          template "Capfile", "Capfile"

          gem "capistrano" 
          gem "unicorn"

          system "chmod +x config/unicorn_init.sh"

          puts ""
          puts ""
          puts "====================================="
          puts "= ensure you've created remote repo ="
          puts "= then push all local changes and   ="
          puts "=       `cap deploy:setup`          ="
          puts "=       `cap deploy:cold`           ="
          puts "====================================="
        else
          self.run_files_generator
        end
      end
    end
  end
end
