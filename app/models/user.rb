class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :reviews
  has_many :cart_items

  # Roles de usuario
  ROLES = %w[admin registered guest client]

  # Métodos de conveniencia para verificar el rol
  def admin?
    role == 'admin'
  end

  def registered?
    role == 'registered'
  end

  def guest?
    role == 'guest'
  end

  def client?
    role == 'client'
  end
end
