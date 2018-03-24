module Ecm
  module Rbac
    module Backend
      class PermissionsController < Itsf::Backend::Resource::BaseController
       include ResourcesController::Sorting

        def self.resource_class
          Ecm::Rbac::Permission
        end

        private

        def permitted_params
          params.require(:permission).reject! { |k,v| k == 'user_ids' }.permit(:identifier, :enabled_from, :enabled_to, role_ids: [])
        end
      end
    end
  end
end