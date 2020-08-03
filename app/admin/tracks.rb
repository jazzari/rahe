ActiveAdmin.register Track do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  belongs_to :simulator, optional: true
  permit_params :name, :simulator_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :simulator_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do 
    def create
      @track = Track.create(permitted_params[:track])
      redirect_to admin_tracks_path
    end


  end

end
