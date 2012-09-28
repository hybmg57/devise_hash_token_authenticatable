module DeviseHashTokenAuthenticatable
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    class_option :user_model, type: :string, default: "user", desc: "Model to update"
    class_option :update_model, type: :boolean, default: true, desc: "Update model to add hash_token_authenticatable to database_authenticatable"
    class_option :add_rescue, type: :boolean, default: true, desc: "Update Application Controller with resuce_from for DeviseHashTokenAuthenticatable::HashTokenException"


    def create_default_devise_settings
      inject_into_file "config/initializers/devise.rb", default_devise_settings, after: "Devise.setup do |config|\n"
    end

    def update_user_model
      gsub_file "app/models/#{options.user_model}.rb", /:database_authenticatable/, ":database_authenticatable, :hash_token_authenticatable" if options.update_model?
    end

    def update_application_controller
      inject_into_class "app/controllers/application_controller.rb", ApplicationController, rescue_from_exception if options.add_rescue?
    end

    private

    def default_devise_settings
      settings = <<-eof
  # ==> Hash Token Configuration
  # config.hash_id = :hash_id
  # config.hash_key = :hash_key

      eof

      settings
    end

    def rescue_from_exception
      <<-eof
  rescue_from DeviseHashTokenAuthenticatable::HashTokenException do |exception|
    render text: exception, status: 500
  end
      eof
    end

  end
end
