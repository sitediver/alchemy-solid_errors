# frozen_string_literal: true

module Alchemy
  module SolidErrors
    class Ability
      include CanCan::Ability

      def initialize(user)
        @user = user

        if admin?
          can :index, :alchemy_admin_errors
          can :manage, :admin_errors
        end
      end

      private

      def admin?
        @user.try(:has_role?, :admin)
      end
    end
  end
end
