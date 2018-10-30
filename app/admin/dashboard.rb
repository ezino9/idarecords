ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    content title: proc{ I18n.t("active_admin.dashboard") } do
      section "Recent Audios", :priority => 1 do
        table_for Audio.order("id desc").limit(15) do
          column :id
          column "Song Title", :title do |audio|
            link_to audio.title, [:admin, audio]
          end
          column "Song Owner", :artist
          column "Categtoy", :type
          column "Uploaded by", :user
      end
    end
    section "Recent Videos", :priority => 2 do
      table_for Video.order("id desc").limit(15) do
        column :id
        column "Song Title", :song_title do |video|
          link_to video.song_title, [:admin, video]
        end
        column "Song Owner", :singer_name
        column "Categtoy", :type
        column "Uploaded by", :user
    end
  end
  section "Recent Posts", :priority => 3 do
    table_for Post.order("id desc").limit(15) do
      column :id
      column "Post Title", :title do |post|
        link_to post.title, [:admin, post]
      end
      column "Categtoy", :category
      column "Posted by", :user
  end
end

    

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
