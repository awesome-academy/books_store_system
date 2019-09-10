name_category = ["Sách kinh tế", "Văn học nước ngoài", "Văn học trong nước", "Sách kỹ năng", "  Sách tuổi teen",
"học ngoại ngữ", "Sách thiếu nhi", "Thường thức đời sống", "Sách chuyên ngành"]

name_category.each do |cate|
  Category.create(name: cate)
end

child_category0 = ["Tài chính", "Kế toán", "Kinh tế học", "Quản trị lãnh đạo", "Khởi nghiệp", "Bài học kinh doanh"]
child_category1 = ["Tiểu sử hồi ký", "Truyện ngắn", "Bách hợp", "Huyền bí", "Kiếm hiệp"]
child_category2 = ["Tiểu thuyết", "Thơ", "Phóng sự", "Ký sự", "Trinh thám", "Kinh dị"]
child_category3 = ["Kỹ năng sống", "Nghệ thuật sống đẹp"]
child_category4 = ["Hướng nghiệp", "Kỹ năng", "Truyện tranh", "Văn học"]
child_category5 = ["Từ điển", "Sách học tiếng Anh", "Sách học tiếng Nhật", "Sách học tiếng Hoa"]
child_category6 = ["Truyện cổ tích", "Truyện kể cho bé", "Văn học", "Kiến thức"]
child_category7 = ["Chăm sóc sức khỏe", "Nấu ăn", "Tâm lý giới tính", "Du lịch văn hóa", "Khởi nghiệp", "Bài học kinh doanh"]
child_category8 = ["Công nghệ thông tin", "Lịch sử địa lý", "Khoa học xã hội", "Y dược", "Mỹ thuật"]
child_category9 = ["Bút", "Sách vở", "Bình nước", "Quà tặng"]

child_category0.each do |child|
  Category.create(name: child, parent_id: 1)
end

230.times.each do
  Product.create(title: Faker::Book.title,
                        category_id: rand(1..46),
                        publisher_name: Faker::Book.publisher,
                        author_name: Faker::Book.author,
                        num_exist: rand(1..50),
                        price: rand(20000...200000),
                        remote_picture_url: "https://loremflickr.com/800/500/book",
                        description: Faker::Lorem.paragraphs
  )
end
User.create(name: "Admin", email: "admin@gmail.com", password: "123123", role: 1)
