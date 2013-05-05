# -*- coding: utf-8 -*-
10.times do |i|
  User.create!(:name => "テスト#{i + 1}", :email => "test-#{i + 1}@test.com", :password => "password")
end
