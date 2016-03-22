module Ecm
  module Rbac
    module Backend
      class UsersController < Itsf::Backend::Resource::BaseController
        def self.resource_class
          Ecm::Rbac::Configuration.user_class
        end

        private

        def permitted_params
          params.require(:user).permit(role_ids: [])
        end
      end
    end
  end
end
