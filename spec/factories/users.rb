FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(Min_length: 8)
    name {Faker::name.last_name}
    email {Faker::Internet.free_email}
    password {password}
    password_confirment {password}