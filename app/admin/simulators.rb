ActiveAdmin.register Simulator do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, tracks_attributes: [:id, :_destroy, :name]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
 index do
      selectable_column
      column "Simulator Name", :name do |simulator|
      link_to simulator.name, admin_simulator_path(simulator)
    end
   
    column "Track Name", :tracks_of_simulator do |simulator|
      link_to simulator.tracks.count, admin_simulator_tracks_path(simulator)
    end
   
    actions
  end

  form do |f|
    
    ### Declare here the model's own form fields:
    f.inputs "Details" do
      f.input :name, label: "Simulator Name"
    end
    
    ### Declare here the form for the child model, using the "has_many" method:
    f.inputs "Tracks" do
      f.has_many :tracks, heading: false, allow_destroy: true do |o|
        o.input :name, label: "Track Name"

     end
    end
    f.actions
  end



end
