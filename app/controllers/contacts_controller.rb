class ContactsController < ApplicationController
  def before_init
    super
    @title= t(:menu_contact)
    @page_itemtype='http://schema.org/ContactPage'
  end

    def index
        @controller_name = t(:menu_support)
        @contact = Contact.new
        @contact.build_contact_content

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @contact }
        end
    end

    def complete
        @controller_name = t(:menu_support)
    end

    # POST /contanct
    # POST /contanct.json
    def create
        @controller_name = t(:menu_support)
        @contact = Contact.new(contact_params)

        respond_to do |format|
            if @contact.save
                format.html { redirect_to complete_contacts_path }
                format.json { render json: @contact, status: :created, location: @contact }
            else
                format.html { render :index }
                format.json { render json: @contact.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
        l_params=params.require(:contact).permit(:name, :title, :point, :enable, contact_content_attributes: [:content])

        if user_signed_in?
          return l_params.merge(user_id: current_user.id)
        else
          return l_params
        end
    end
end
