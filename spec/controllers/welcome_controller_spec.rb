require 'spec_helper'

describe WelcomeController do
  describe "GET index" do
    it "renders the index" do
      get :index
      response.should render_template action: :index
    end
  end
end
