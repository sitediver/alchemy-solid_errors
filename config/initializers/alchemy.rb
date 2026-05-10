Alchemy.configure do |config|
  config.abilities.add("Alchemy::SolidErrors::Ability")
  config.admin_stylesheets << "alchemy/solid_errors/alchemy-admin.css"
end

Rails.application.config.to_prepare do
  if SolidErrors.connects_to.present?
    Alchemy::Modules.register_module({
      name: "errors",
      engine_name: "alchemy",
      position: 7.1,
      navigation: {
        name: "modules.errors",
        controller: "/alchemy/admin/errors",
        action: "index",
        icon: "bug"
      }
    })
  end
end
