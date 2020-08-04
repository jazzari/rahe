ActiveAdmin.register Track do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  belongs_to :simulator, optional: true
  permit_params :name, :simulator_id, cars_attributes: [:id, :_destroy, :name]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :simulator_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
   index do
      selectable_column

      column "Track Name", :name do |track|
        link_to track.name, admin_track_path(track)
      end
   
      column "Number of Cars", :cars_of_track do |track|
        link_to track.cars.count, admin_track_cars_path(track)
      end
   
    actions
  end

  controller do 

    def show
      redirect_to admin_track_cars_path(resource)
    end

    def create
      @track = Track.create(permitted_params[:track])
      redirect_to admin_tracks_path
    end
  end

    form do |f|
    
      # Model's own fields:
      f.inputs "Details" do
        f.input :name, label: "Track Name"
      end
      
      # Child model fields, using the "has_many" method:
      f.inputs "Cars" do
        f.has_many :cars, heading: false, allow_destroy: true do |o|
          o.input :name, label: "Car Name"

       end
      end
      f.actions
    end

end
