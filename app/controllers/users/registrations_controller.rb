class Users::RegistrationsController < Devise::RegistrationsController
    def create
      build_resource(sign_up_params)
      resource.role = 'customer'
      
      if resource.save
        redirect_to new_user_session_path
      else
        render :new
      end
  end
end