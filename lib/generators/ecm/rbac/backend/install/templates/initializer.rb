Ecm::Rbac::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Rbac::Backend::RolesController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Rbac::Backend::UsersController,
      Ecm::Rbac::Backend::RolesController,
      Ecm::Rbac::Backend::PermissionsController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[]}
  #
  config.registered_services = -> { [] }
end
