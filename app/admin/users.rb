ActiveAdmin.register User do

actions :all, :except => [:new]
permit_params :spam

	form do |f|
	  f.inputs "Users" do
	    f.input :spam
	  end
	  f.actions
	end

	show do
	  attributes_table do
	    row :name
	    row :email
	   	row :spam
	   	row	:created_at
	  end
	end

	index do
	  selectable_column
	  column :name
	  column :email
	  column :spam
	  column :created_at
	  actions
	end

	filter :name
	filter :email
	filter :spam
	filter :created_at
end
