class Companies::RegistrationsController < Devise::RegistrationsController
    def new
      build_resource
      render 'devise/registrations/newcompany'
    end
    
    def create
      build_resource(sign_up_params)
      resource.role = 'company'
      if resource.save
        redirect_to new_company_session_path
      else
        render 'devise/registrations/newcompany'
      end 
    end
    
    private
    
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :cvr_number, :company_name)
    end
  end