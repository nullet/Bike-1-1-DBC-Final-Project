require 'rails_helper'

# RSpec.describe User, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do

  it { should have_many(:requests).class_name('Event').with_foreign_key('requester_id') }
  it { should have_many(:responses).class_name('Event').with_foreign_key('responder_id') }

end