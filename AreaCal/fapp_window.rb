module CalCulate
    class AppWin < Gtk::Window 
        type_register
        #attr_accessor :len_entry
        class << self
            def init
                set_template resource: '/com/iridakos/AreaCal/fWindow.ui'
                bind_template_child 'length_entry'
                bind_template_child 'width_entry'
                bind_template_child 'type_combo'
                bind_template_child 'cancel_button'
                bind_template_child 'cal_button'
                bind_template_child 's_label'
            end
        end

        

        def initialize(application)
            super application: application
            set_title 'Area Calculator'
            #self.len_entry = length_entry.text
            #@len_entry = length_entry.text#fapp.length_entry if fapp.length_entry 
            #get if application.length_entry
            #@width_entry.text = application.width_entry if application.width_entry
            #type_combo.text = application.dropdown if application.dropdown

            #Configure the combo box
			model = Gtk::ListStore.new(String)
			CalCulate::Application::DROPDOWN.each do |dropdown|
				iterator = model.append
				iterator[0] = dropdown
			end

            type_combo.model = model 
			renderer = Gtk::CellRendererText.new
			type_combo.pack_start(renderer, true)
			type_combo.set_attributes(renderer, "text" => 0)
			type_combo.set_active(CalCulate::Application::DROPDOWN.index(application.dropdown)) if application.dropdown
            
            cancel_button.signal_connect 'clicked' do |button|
                close
            end

            cal_button.signal_connect 'clicked' do |button|
                #puts 'Button Click Successful'
                l = Float(length_entry.text)
                w = Float(width_entry.text)
                if type_combo.active == 1
                    per = 2*(l + w)
                    s_label.text = "The Perimeter is #{per}"
                else
                    
                    prod = l*w
                    s_label.text = "The Area is #{prod}"
                end
                #new_val_window = CalCulate::ValWin.new(application)
                #new_val_window.present
            end

        end
    end
end

