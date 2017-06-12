class AttendancesController < ApplicationController
    def user_attendance
        attend = {user_id: params[:user_id], check_in: params[:check_in]}
        att = current_user.attendances.each.map { |d| d.created_at.strftime("%Y-%m-%d")}
        if att.include? Time.now.strftime("%Y-%m-%d")
            @user_attendance = Attendance.where("user_id =?", params[:user_id])
            @user_attendance.update(:check_out => params[:check_out])
            reset_session
        else
            @user_attendance = Attendance.new(attend)    
            @user_attendance.save
        end
        respond_to do |format|
            format.html  { redirect_to(root_path,:notice => 'Successfully Checked In.') }
        end
    end
end
