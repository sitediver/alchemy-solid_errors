Rails.application.config.to_prepare do
  require "alchemy/solid_errors/ability"

  Alchemy.register_ability(Alchemy::SolidErrors::Ability)
  Alchemy.admin_stylesheets << "alchemy/solid_errors/alchemy-admin.css"

  Alchemy::Modules.register_module({
    name: "errors",
    engine_name: "alchemy",
    position: 7.1,
    navigation: {
      name: "modules.errors",
      controller: "/alchemy/admin/errors",
      action: "index",
      icon: "stack"
    }
  })
end
