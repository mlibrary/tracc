class TrackCommentComment1 < ActiveRecord::Migration[5.2]
  def change
  	change_column :track_comments, :comment1,  :text
  	change_column :track_comments, :comment2,  :text
  	change_column :track_comments, :comment3,  :text
  	change_column :track_comments, :comment4,  :text
  end
end
