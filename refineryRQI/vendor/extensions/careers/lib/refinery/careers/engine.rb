module Refinery
  module Careers
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Careers

      engine_name :refinery_careers

      initializer "register refinerycms_careers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "careers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.careers_admin_careers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/careers/career',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Careers)
      end
    end
  end
end
