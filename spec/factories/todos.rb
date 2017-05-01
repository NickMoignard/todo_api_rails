# Define model factory which will provide the test data for todo's
FactoryGirl.define do
    factory :todo do
        title { Faker::Lorem.word }
        created_by { Faker::Number.number(10) }
        # NOTE
        # By having the Faker methods execute inside a block
        # We ensure that faker generates dynamic data on every innvocation
    end
end
