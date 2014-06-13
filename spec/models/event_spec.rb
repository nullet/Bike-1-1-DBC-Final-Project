require 'rails_helper'

# RSpec.describe Event, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Event do

  it { should belong_to(:requester).class_name('User')}
  it { should belong_to(:responder).class_name('User')}

end