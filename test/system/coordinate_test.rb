require "application_system_test_case"

class CoordinatesTest < ApplicationSystemTestCase
  setup do
    @user = User.create(nickname: 'john', email: 'john@example.com', password: '000000', password_confirmation: '000000')
    @coordinate = Coordinate.new(name: '定番ジャケット', image: 'https://img1.kakaku.k-img.com/images/tasclapicv/450/000/000/1/1376/tasclapimage_1376_12_1.jpg?d=20160316134944', gender_id: 1, user_id: @user.id)
    @coordinate.category_tags.build(name: 'ジャケット', color: 'ネイビー')
    @coordinate.save
    visit root_path
  end

  test "visiting the index" do
    assert_text '定番ジャケット'
  end
end
