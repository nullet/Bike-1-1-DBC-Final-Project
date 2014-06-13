require 'rails_helper'

# RSpec.describe Event, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Event do

  it { should belong_to(:requester).class_name('User')}
  it { should belong_to(:responder).class_name('User')}

  it { should have_db_column(:requester_id) }
  it { should have_db_column(:responder_id) }
  it { should have_db_column(:latitude) }
  it { should have_db_column(:longitude) }
  it { should have_db_column(:active) }

end