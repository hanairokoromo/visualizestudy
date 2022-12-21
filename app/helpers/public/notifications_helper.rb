module Public::NotificationsHelper
    def notification_form(notification)
        @visitor = notification.visitor
        @comment = nil
        your_post = link_to 'あなたの投稿', users_post_path(notification), style: "font-weight: bold;"
        @visitor_comment = notification.comment_id
        # notification.actionがfollowかfavoriteかcommentか
        case notification.action
        when "follow" then
            tag.a(notification.visitor.account_name, href: users_user_path(@visitor), style: "font-weight: bold;")+"があなたをフォローしました"
        when "favorite" then
            tag.a(notification.visitor.account_name, href: users_user_path(@visitor), style: "font-weight: bold;")+"が"+tag.a('あなたの投稿', href: users_post_path(notification.post_id), style: "font-weight: bold;")+"にいいねしました"
        when "comment" then
            @comment = Comment.find_by(id: @visitor_comment)&.content
            tag.a(@visitor.account_name, href: users_user_path(@visitor), style: "font-weight: bold;")+"が"+tag.a('あなたの投稿', href: users_post_path(notification.post_id), style: "font-weight: bold;")+"にコメントしました"
	    end
	end
	
	def unchecked_notifications
	    @notifications = current_user.passive_notifications.where(checked: false)
	end
end
