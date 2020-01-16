
FactoryGirl.define do
  factory :user do
    
  end
  factory :super_user do
    
  end

  factory :city do
    name 'City'
    cityname 'city'
    name_ru 'city'
    name_pt 'city'
    name_en 'city'
  end

  factory :gallery do
    name 'xxTestxx'
    is_trash false
    after :build do |g|
      g.site ||= Site.new( :domain => 'xxDomainxx', :lang => 'xxLangxx' )
    end
  end

  factory :photo do
  end

  factory :report do
    name 'Report Name'
  end

  factory :site do
  end

  factory :tag do
    name 'tag-name'
  end

  factory :user do
    email 'test@gmail.com'
    password '12345678'
  end

  factory :user_profile, :class => IshModels::UserProfile do
    email 'user@email.com'
    name 'some-name'
    after :build do |p|
      u = User.find_or_create_by :email => p.email
      p.user = u
    end
  end

end
