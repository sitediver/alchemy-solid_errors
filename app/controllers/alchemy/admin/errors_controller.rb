# frozen_string_literal: true

module Alchemy
  module Admin
    class ErrorsController < Alchemy::Admin::BaseController
      authorize_resource class: :admin_errors
    end
  end
end
