# frozen_string_literal: true

module SolidusPrintInvoice
  module Spree
    module Admin
      module OrdersControllerDecorator
        def self.prepended(base)
          base.class_eval do
            respond_to :pdf
            helper ::Spree::Admin::PrintInvoiceHelper
          end
        end

        def show
          load_order
          respond_with(@order) do |format|
            format.pdf do
              render layout: false, template: "spree/admin/orders/packaging_slip", formats: [:pdf], handlers: [:prawn]
            end
          end
        end

        ::Spree::Admin::OrdersController.prepend self
      end
    end
  end
end
