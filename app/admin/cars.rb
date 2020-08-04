ActiveAdmin.register Car do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  belongs_to :track, optional: true
  permit_params :name, :track_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :track_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu false
  
  controller do 
    def find_track

    end

    def create
      @car = Car.create(permitted_params[:car])
      redirect_to admin_track_cars_path
    end
  end

end
