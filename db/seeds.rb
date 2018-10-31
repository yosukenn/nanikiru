Gender.create(gender: 'man')
Gender.create(gender: 'woman')

coordinate1 = Coordinate.new(name: 'テーラードジャケットコーデ', image: 'https://o.imgz.jp/fashionnews/106274/kbeigeqaljrbonh.jpg', gender_id: 1, user_id: 1)
coordinate1.category_tags.build(name: 'テーラードジャケット', color: 'ブラック')
coordinate1.save

coordinate2 = Coordinate.new(name: 'デニムジャケットコーデ', image: 'https://otokomaeken.com/wp-content/uploads/2018/02/DSC_0128.jpg', gender_id: 1, user_id: 1)
coordinate2.category_tags.build(name: 'デニムジャケット', color: 'ブルー')
coordinate2.save

coordinate3 = Coordinate.new(name: 'ミリタリージャケットコーデ', image: 'https://image.t-fashion.jp/coordinates/images/000/017/741/original/267395_1.jpg?1478168836', gender_id: 1, user_id: 1)
coordinate3.category_tags.build(name: 'ミリタリージャケット', color: 'カーキ')
coordinate3.save
