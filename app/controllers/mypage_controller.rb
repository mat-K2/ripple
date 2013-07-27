class MypageController < ApplicationController
  def index
    @approve_entry_count = current_user.entries.where(:approve_flg => true).count
  end
end
