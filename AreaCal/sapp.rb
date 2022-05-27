module CalCulate
    class SecApplication < Gtk::Application
        
        def initialize(application)
            super 'com.iridakos.area', Gio::ApplicationFlags::FLAGS_NONE

            signal_connect :activate do |application|
                awindow = CalCulate::ValWin.new(application)
                awindow.present
            end
        end
    end
end