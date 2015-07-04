ActiveAdmin.register Bus do

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

  permit_params :company_id , :name , :type , :reg_no , :body_no, :plate_no , :capacity

  index do
    id_column
    column :company_id do |n|
      Company.find(n.company_id).name
    end
    column :name
    column :type
    column :reg_no
    column :body_no
    column :plate_no
    column :capacity
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
    f.inputs "Bus Details" do
      f.input :company_id, :as => :select , :collection => Company.all.map{|c|["#{c.name}", c.id] }
      f.input :name
      f.input :reg_no
      f.input :body_no
      f.input :plate_no
      f.input :capacity
      f.input :status , :as => :select , :collection => options_for_select([['Inactive' , '0' ], ['In-Progress' , '1' ], ['Active' , '2']]) , include_blank: 'Select Status'

    end
    f.actions
  end



end
