module HomeHelper
	def update_notifications
		TagUser.where('tag_id =? and tag_type =?',"#{current_user.id}","User").update_all(:read=>true)
	end
end
