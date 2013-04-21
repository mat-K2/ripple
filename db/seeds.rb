# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => "yamada@test.com", :password => "password", :name => "山田太郎")
@maker_1 = User.create(:email => "tanaka@test.com", :password => "password", :name => "田中一郎")
@maker_2 = User.create(:email => "suzuki@test.com", :password => "password", :name => "鈴木花子")

@service_1 = Service.new(:name => "Deshiel", :url => "http://deshiel.herokuapp.com/", :summary => "弟子入りアプリです。", :introduction => "弟子は目標を設定し、師匠は弟子の目標達成を助ける。", :category => "education")
@service_1.make_users.build(:user_id => @maker_1.id)
@service_1.save

@service_2 = Service.new(:name => "My-Dictionary", :url => "http://my-dictionary.herokuapp.com/", :summary => "英単語の意味を簡単に調べることができるアプリです。", :introduction => "画面右側で英文を読んでいて、意味のわからない単語があれば画面左側ですぐ調べることができます。", :category => "education")
@service_2.make_users.build(:user_id => @maker_1.id)
@service_2.save

@service_3 = Service.new(:name => "ランチメール", :url => "https://lunch-mail.heroku.com/", :summary => "今日のランチと店をおすすめしてくれるアプリです。", :introduction => "ランチに行く時間と現在位置を登録したら、指定時刻にランチメールが届きます。", :category => "life")
@service_3.make_users.build(:user_id => @maker_2.id)
@service_3.save
