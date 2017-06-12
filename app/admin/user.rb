ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
    controller do
        def destroy
            @user = User.find(params[:id])
            UserMailer.destroy_email(@user).deliver
            super
        end
    end
    filter :first_name
    filter :last_name
    filter :username
    filter :email
    index do
        column :first_name
        column :last_name
        column :username
        column :email
        column :admin
        actions
    end
end
