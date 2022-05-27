module CalCulate
    class Application < Gtk::Application
        PROPERTIES = [:dropdown, :length_entry, :width_entry].freeze
        DROPDOWN = ["Area","Perimeter"].freeze
        attr_accessor *PROPERTIES
        def initialize
            super 'com.iridakos.area', Gio::ApplicationFlags::FLAGS_NONE
            #@dropdown = DROPDOWN
            signal_connect :activate do |application|
                window = CalCulate::AppWin.new(application)
                window.present
            end
        end
    end
end