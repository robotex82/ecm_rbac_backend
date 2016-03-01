module Ecm::Rbac
  module Backend
    class PermissionsController < Itsf::Backend::Resource::BaseController
      def self.resource_class
        Ecm::Rbac::Permission
      end

      private

      def permitted_params
        params.require(:permission).except!(:user_ids).permit(:identifier, :enabled_from, :enabled_to, role_ids: [])
      end
    end
  end
end
