module Alchemy
  module SolidErrors
    class Engine < ::Rails::Engine
      isolate_namespace Alchemy
      engine_name "alchemy_solid_errors"

      initializer "alchemy_solid_errors.assets" do |app|
        app.config.assets.precompile += %w[alchemy/solid_errors/alchemy-admin.css alchemy/solid_errors/solid-errors.css]
      end
    end
  end
end
