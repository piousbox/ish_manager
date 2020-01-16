require 'rails_helper'

RSpec.describe SuperUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
   context 'validation tests' do
   it 'ensure email presence' do 
   	user = User.new(last_name: 'Last', email: 'sadb@jfkdsjf.com').save
   	expect(user).to eq(false)
   end
   it 'ensure email presence' do 
   	   	user = User.new(last_name: 'Last', email: 'sadb@jfkdsjf.com').save
   	expect(user).to eq(false)
   end
   it 'should save successfully' do 
   	   	user = User.new(password: '12345678', email: 'test@gmail.com').save
   	expect(user).to eq(true)
   end
 end
 	context 'scope tests' do 
 	end
end
