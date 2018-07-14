ActiveAdmin.register Player do

permit_params :name, :email, :about,:image,:spam

form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Players" do
    f.input :name
    f.input :email
    f.input :about
    f.input :image, :as => :file
  end
  f.actions
end

end
