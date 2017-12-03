require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Todos" do
  get "/todos" do
    example "Listing todos" do
      do_request

      status.should == 200
    end
  end
end