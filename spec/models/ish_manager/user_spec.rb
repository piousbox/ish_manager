require 'spec_helper'
require 'rails_helper'
module IshManager
  RSpec.describe User, type: :model do
  	context 'validation tests' do 
  		it  'ensure first name presence' do
  			user = User.new(last_name: 'last', email: 'asdb@eek.com').save
  			expect(user).to eq(false)
  		end
  		it 'ensure email presence' do
          	user = User.new(password: 'last', email: 'asdb@eek.com').save
  			expect(user).to eq(false)  
  		end
  		it 'should save successfully' do 
  			 user = User.new(password: 'last', email: 'asdb@eek.com').save
  			expect(user).to eq(true) 

  		end
  	end
    context 'scope tests' do 

    end
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end
end
end
