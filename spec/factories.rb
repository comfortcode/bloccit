FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end 
    user = FactoryGirl.create(:user)
    user.confirmed_at = Time.now
    user.save
end
Warden.test_reset! 
