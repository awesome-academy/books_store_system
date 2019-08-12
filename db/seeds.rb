User.create!(name: ENV["NAME"],
                  email: ENV["GMAIL"] ,
                  address: ENV["ADDRESS"],
                  phone: ENV["PHONE"],
                  password: ENV["PASS"],
                  password_confirmation: ENV["PASS_CONFIRM"],
                  role: 1,
                  activated_at: Time.zone.now)
