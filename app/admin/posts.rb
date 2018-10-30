ActiveAdmin.register Post do

permit_params :title, :body, :category_id, :user_id


action_item :publish, only: :show do
    link_to "Publish", publish_admin_post_path(post), method: :put if !post.created_at?
end
action_item :unpublish, only: :show do
    link_to "Unpublish", publish_admin_post_path(post), method: :put if post.created_at?
end

member_action :publish, method: :put do
    post = Post.find(params[:id])
    post.update(created_at: Time.zone.now)
    redirect_to admin_post_path(post)
end
member_action :unpublish, method: :put do
    post = Post.find(params[:id])
    post.update(created_at: nil)
    redirect_to admin_post_path(post)

end
index do
    #column :id 
    column :title
    column :user
    column :created_at
    column :updated_at
    actions
end
end
