require 'spec_helper'

describe CardsController do
	render_views

	#
	# Front
	#

	context "GET front" do
    context "without an existing User" do
      before(:each) { get :front }

      it { should respond_with(:success) }
      it { should render_template(:front) }

      it "should create a new User" do
        assigns(:current_user).should_not be nil
      end

      it "should set the cookie" do
        response.cookies['cardulus'].should_not be nil
      end

      it "should set the cookie to be the User's cookie" do
        response.cookies['cardulus'].should == assigns(:current_user).cookie
      end
    end

    context "with an existing User" do
      before(:each) do
        @user = create(:user)
        cookies['cardulus'] = @user.cookie
        get :front
      end

      it { should respond_with(:success) }
      it { should render_template(:front) }

      it "should find the User" do
        assigns(:current_user).should == @user
      end

      it "should set the cookie to be the User's cookie" do
        cookies['cardulus'].should == @user.cookie
      end
    end

	end

end
