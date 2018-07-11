ActiveAdmin.register User do

actions :all, :except => [:new,:edit]
	

	
	show do
	  attributes_table do
	    row :name
	    
	    row :email
	   
	  end
	end

	index do
	  selectable_column
	  column :name
	  
	  column :email
	  column :created_at
	  
	  actions
	end

	filter :name
	filter :email
end
