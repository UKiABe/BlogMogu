class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # 認証画面を表示する場合は:registerable,を追加
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
