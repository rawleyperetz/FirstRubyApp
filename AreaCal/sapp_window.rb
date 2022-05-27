module CalCulate
    class ValWin < Gtk::Window 
        type_register
        
        class << self
            def init
                set_template resource: '/com/iridakos/AreaCal/sWindow.ui'
                bind_template_child 'val_label'
                bind_template_child 'another_cancel_button'
            end
        end

        def initialize(application)
            super application: application
            set_title 'Area Calculator'
            
            val_label.text = "Bollocks says #{AppWin.new}"

            another_cancel_button.signal_connect 'clicked' do |button|
                close
            end
        end
    end
end

 