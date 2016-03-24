module Ecm::Rbac
  module Backend
    class ImportDefaultPermissionsServiceController < Itsf::Backend::Service::BaseController
      def self.service_class
        Ecm::Rbac::ImportDefaultPermissionsService
      end

      def invoke
        @filenames = load_filenames
        super
      end

      def call
        @filenames = load_filenames
        super
      end

      private

      def permitted_params
        params.require(:import_default_permissions_service).permit(:filename)
      end

      def load_filenames
        filenames = ::Rails::Engine.subclasses.map(&:instance).collect do |engine|
          filename = engine.root.join *%w(config rbac.yml)
          next unless File.readable? filename
          filename
        end.compact
        application_filename = Rails.root.join *%w(config rbac.yml)
        filenames << application_filename if File.readable? application_filename#
        filenames
      end
    end
  end
end
