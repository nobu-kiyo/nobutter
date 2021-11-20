class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string      :recommend
      t.text        :reason
      t.timestamps
    end
  end
end
