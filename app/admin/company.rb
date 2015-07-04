ActiveAdmin.register Company do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  permit_params :name, :address , :email , :telno , :status

  index do

    id_column
    column :name
    column :address
    column :email
    column :telno
    column(:status) do |s|
      # s.status == 2 ? status_tag( "active", :green ) : status_tag( "inactive" , :red )
      if s.status == 2
        s.status = status_tag("Active" , :green)
      elsif s.status == 1
        s.status = status_tag("In-Progress" , :blue)
      else s.status == 0
        s.status = status_tag("In-Active" , :red)
      end

    end
    actions
  end

  form do |f|
    f.inputs "Company Details" do
      f.input :name
      f.input :address
      f.input :email
      f.input :telno
      f.input :status , :as => :select , :collection => options_for_select([['Inactive' , '0' ], ['In-Progress' , '1' ], ['Active' , '2']]) , include_blank: 'Select Status'
    end
    f.actions
  end



end




