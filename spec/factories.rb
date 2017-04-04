FactoryGirl.define do
  factory :cuisine do
    title 'Junk'
    image 'tmp.jpg'
  end

  factory :bad_cuisine_image, class: Cuisine do
    title 'Invalid'
    image 'bad.gif'
  end

  factory :resturant do
    name 'Boohoo'
    max_delivery_time 60
    association :cuisine
  end

  factory :invalid_resturant, parent: :resturant do |f|
    f.name nil
  end

  factory :review do
    reviewer 'John'
    rating 0

    factory :review_invalid_rating do
      rating 4
    end
  end

end