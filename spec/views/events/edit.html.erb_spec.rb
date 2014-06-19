require 'rails_helper'

RSpec.describe "events/edit", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :requester_id => 1,
      :responder_id => 1,
      :latitude => 1.5,
      :longitude => 1.5,
      :active => false
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "[name=?]", "event[request_text]"

      # assert_select "input#event_responder_id[name=?]", "event[responder_id]"

      # assert_select "input#event_latitude[name=?]", "event[latitude]"

      # assert_select "input#event_longitude[name=?]", "event[longitude]"

      # assert_select "input#event_active[name=?]", "event[active]"
    end
  end
end
