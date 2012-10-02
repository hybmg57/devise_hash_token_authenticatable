class CreateHashKey<%= options.user_model.split('_').collect!{ |w| w.capitalize }.join %> < ActiveRecord::Migration
  def change
		add_column :<%= options.user_model.pluralize %>, :hash_key, :string
  end
end
