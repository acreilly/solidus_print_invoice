# frozen_string_literal: true

module Spree
  class PrintInvoiceConfiguration < Preferences::Configuration
    preference :print_invoice_font_face, :string, default: 'Helvetica'
    preference :prawn_options, :hash, default: {}
  end
end
