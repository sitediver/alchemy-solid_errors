Rails.application.config.to_prepare do
  SolidErrors.base_controller_class = "Alchemy::Admin::ErrorsController"
end
