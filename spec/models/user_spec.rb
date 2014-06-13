require 'rails_helper'

# RSpec.describe User, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do

  it { should have_many(:requests).class_name('Event').with_foreign_key('requester_id') }
  it { should have_many(:responses).class_name('Event').with_foreign_key('responder_id') }

  it { should have_db_column(:name) }
  it { should have_db_column(:email) }
  it { should have_db_column(:password) }
  it { should have_db_column(:phone) }
  it { should have_db_column(:hb_latitude) }
  it { should have_db_column(:hb_longitude) }
  it { should have_db_column(:hb_radius) }
  it { should have_db_column(:home_base) }
  it { should have_db_column(:karma_count) }

end