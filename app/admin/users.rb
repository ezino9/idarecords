ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :email,:password
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

 form do |f|
    f.inputs "Details" do
        f.input :name, label: 'Name'
        f.input :email, label: 'Email'
        f.input :password, label: 'Password'
        f.actions
    end 
end

index do
    #column :id
    column :email
    column :name
    column :created_at
    actions
end

end
