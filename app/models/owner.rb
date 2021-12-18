class Owner < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  # esta callback se ejecutará después de crear un nuevo usuario
  after_create :creacion_exitosa

  # esta callback se ejecutará después de actualizar un usuario existente
  after_update :actualizacion_exitosa

  private
  def creacion_exitosa
    puts "Asociacion de blog a usuario creada con exito."
  end
  def actualizacion_exitosa
    puts "Asociacion de blog a usuario actualizada con exito."
  end
end
