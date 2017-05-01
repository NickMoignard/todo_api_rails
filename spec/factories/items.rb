# Define model factory which will provide the test data for items

FactoryGirl.define do
    factory :item do
        name { Faker::StarWars.character }
        done false
        todo_id nil
    end
end
