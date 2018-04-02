module UsersHelper
    def has_posts_history 
        current_user.posts.any?
    end

    def has_comments_history 
        current_user.comments.any?
    end

    def has_favorites_history
        current_user.favorites.any?
    end
end
