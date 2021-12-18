class Blog < ApplicationRecord
    has_many :post, dependent: :destroy
    has_many :posts, dependent: :destroy

    validates :name, :description, presence: true

    # esta callback se ejecutará después de crear un nuevo usuario
    after_create :creacion_exitosa
  
    # esta callback se ejecutará después de actualizar un usuario existente
    after_update :actualizacion_exitosa

    private
    def creacion_exitosa
      puts "Blog creado con exito."
    end
    def actualizacion_exitosa
      puts "Blog actualizado con exito."
    end
end
