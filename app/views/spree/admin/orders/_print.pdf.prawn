require 'prawn/layout'

@font_face = Spree::PrintInvoice::Config[:print_invoice_font_face]

font @font_face

font @font_face,  :size => 20,  :style => :bold
text @order.store.name

fill_color "E99323"
text I18n.t('spree.packaging_slip'), :align => :right, :style => :bold, :size => 18

fill_color "000000"

move_down 4

font @font_face,  :size => 9
text "#{I18n.t('spree.order_number', :number => @order.number)}", :align => :right


render :partial => "address"

move_down 30

render :partial => "line_items_box"

move_down 8

# Footer
render :partial => "footer"
