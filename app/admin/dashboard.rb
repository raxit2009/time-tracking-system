ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Today Login User" do
          ul do
            i = 0
            Attendance.all.each.map do |attend|
              if(Time.now.strftime("%d-%m-%Y") == attend.created_at.strftime("%d-%m-%Y"))
                if attend.check_in.split(":")[0].to_i > 10
                  i += 1 
                end
              end
            end
            div i
          end
        end
        
      end
    end
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
