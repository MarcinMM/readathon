class AddClickLoggingToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :email_sent_date, :datetime
    add_column :pledges, :email_click_date, :datetime
  end
end