# -*- coding: utf-8 -*-
class Entry < ActiveRecord::Base
  attr_accessible :content, :service_id, :approve_flg
  belongs_to :user
  belongs_to :service

  validates :content, :presence => true

  def user_name
    self.user.name
  end

  def service_name
    self.service.name
  end

  def approval_status
    if self.approve_flg == true
      "承認済み"
    else
      if self.created_at < Date.today - 7.day
        "非承認"
      else
        "承認待ち"
      end
    end
  end
end
