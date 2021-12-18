class User < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :owners, dependent: :destroy

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

    # esta callback se ejecutará antes de guardar, al crear y al actualizar
    before_save :downcase_email
    
    # esta callback se ejecutará después de crear un nuevo usuario
    after_create :creacion_exitosa
    
    # esta callback se ejecutará después de actualizar un usuario existente
    after_update :actualizacion_exitosa
    
    private
    def downcase_email
        self.email.downcase!
    end
    def creacion_exitosa
        puts "Usuario creado con exito."
    end
    def actualizacion_exitosa
        puts "Usuario actualizado con exito."
    end

end
