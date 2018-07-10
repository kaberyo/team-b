class Comment < ActiveRecord::Base
  belongs_to :prtotype               #protptypesテーブルとのアソシエーション
  belongs_to :user                   #usersテーブルとのアソシエーション
end
