require 'spec_helper'

describe RemindersController do

  # This should return the minimal set of attributes required to create a valid
  # Reminder. As you add validations to Reminder, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe "GET index" do
    it "assigns all reminders as @reminders" do
      reminder = Reminder.create! valid_attributes
      get :index
      assigns(:reminders).should eq([reminder])
    end
  end

  describe "GET show" do
    it "assigns the requested reminder as @reminder" do
      reminder = Reminder.create! valid_attributes
      get :show, {:id => reminder.to_param}
      assigns(:reminder).should eq(reminder)
    end
  end

  describe "GET new" do
    it "assigns a new reminder as @reminder" do
      get :new, {}
      assigns(:reminder).should be_a_new(Reminder)
    end
  end

  describe "GET edit" do
    it "assigns the requested reminder as @reminder" do
      reminder = Reminder.create! valid_attributes
      get :edit, {:id => reminder.to_param}
      assigns(:reminder).should eq(reminder)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reminder" do
        expect {
          post :create, {:reminder => valid_attributes}
        }.to change(Reminder, :count).by(1)
      end

      it "assigns a newly created reminder as @reminder" do
        post :create, {:reminder => valid_attributes}
        assigns(:reminder).should be_a(Reminder)
        assigns(:reminder).should be_persisted
      end

      it "redirects to the created reminder" do
        post :create, {:reminder => valid_attributes}
        response.should redirect_to(Reminder.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reminder as @reminder" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reminder.any_instance.stub(:save).and_return(false)
        post :create, {:reminder => {}}
        assigns(:reminder).should be_a_new(Reminder)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reminder.any_instance.stub(:save).and_return(false)
        post :create, {:reminder => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reminder" do
        reminder = Reminder.create! valid_attributes
        # Assuming there are no other reminders in the database, this
        # specifies that the Reminder created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Reminder.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => reminder.to_param, :reminder => {'these' => 'params'}}
      end

      it "assigns the requested reminder as @reminder" do
        reminder = Reminder.create! valid_attributes
        put :update, {:id => reminder.to_param, :reminder => valid_attributes}
        assigns(:reminder).should eq(reminder)
      end

      it "redirects to the reminder" do
        reminder = Reminder.create! valid_attributes
        put :update, {:id => reminder.to_param, :reminder => valid_attributes}
        response.should redirect_to(reminder)
      end
    end

    describe "with invalid params" do
      it "assigns the reminder as @reminder" do
        reminder = Reminder.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reminder.any_instance.stub(:save).and_return(false)
        put :update, {:id => reminder.to_param, :reminder => {}}
        assigns(:reminder).should eq(reminder)
      end

      it "re-renders the 'edit' template" do
        reminder = Reminder.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reminder.any_instance.stub(:save).and_return(false)
        put :update, {:id => reminder.to_param, :reminder => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reminder" do
      reminder = Reminder.create! valid_attributes
      expect {
        delete :destroy, {:id => reminder.to_param}
      }.to change(Reminder, :count).by(-1)
    end

    it "redirects to the reminders list" do
      reminder = Reminder.create! valid_attributes
      delete :destroy, {:id => reminder.to_param}
      response.should redirect_to(reminders_url)
    end
  end

end
