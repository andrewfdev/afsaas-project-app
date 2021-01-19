class MembersController < ApplicationController
    def new
        @member = Member.new
        @user = current_user
    end

    def create
        
        # @member = Member.new(member_params)
        # @member.user = current_user
        Member.create_new_member(current_user, member_params)
        # if @member.save
        #     flash[:notice] = "Member Created"
        # else8 
        8
        #     flash[:notice] = "There was an error adding a new member"
        #     render 'new'
        # end
        redirect_to root_path
    end


    def member_params
        params.require(:member).permit(:first_name, :last_name)
    end

end
