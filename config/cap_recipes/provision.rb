# ------= Provision the server =------
namespace :provision do
  desc "Provisions a server from scratch"
  task :default do
    nginx.install
    setup_ruby_and_rvm
    install_app_specific_packages
  end
  
  desc "Installs RVM and required Ruby version"
  task :setup_ruby_and_rvm do
    rvm.install_rvm
    rvm.install_ruby
  end
  
  desc "Installs the app-specific packages"
  task :install_app_specific_packages do
    required_packes = ["libpq-dev"]
    
    required_packages.each do |package|
      run "#{sudo} apt-get -y install #{package}"
    end
  end
end
