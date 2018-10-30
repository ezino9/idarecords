ActiveAdmin.register Audio do
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
permit_params :title, :artist, :user_id, :label, :type_id , :song_audio

index do
    column :title
    column :artist
    column :user
    column :created_at
    column :updated_at
    actions
end
end
