# metaprogramming - módulo

# cassio = 'teste'
# def cassio.olha
#   'teste cassio'
# end

# # herança por comportamento
# cassio.olha
# a = cassio.clone
# puts a.olha

# b = cassio.dup
# puts b
# puts b.olha # undefined method `olha' for "teste":String

# clone = copia valores de variáveis e métodos (comportamentos)
# dup = duplica sem as valores das variáveis mas não a metaprogramação

###########################################################################
# cassio = 'teste'

# forma de definir vários métodos ou atributos em escala de forma mais prática
# class << cassio
#   def olha1
#     'olha 1'
#   end

#   def olha2
#     'olha 2'
#   end

#   def olha3
#     'olha 3'
#   end
# end

# puts cassio.olha1
# puts cassio.olha2
# puts cassio.olha3

###########################################################################

# definindo métodos de classe em escala
# class Cassio
#   class << self
#     def olha1
#       'olha 1'
#     end

#     def olha2
#       'olha 2'
#     end

#     def olha3
#       'olha 3'
#     end
#   end
# end

# puts Cassio.olha1

###########################################################################

# definindo get e set como métodos de classe
# class Cassio
#   class << self
#     attr_accessor :nome
#   end
# end

# Cassio.nome = 'Santana'
# puts Cassio.nome

###########################################################################

# usando módulo como namespace
module Utilidades
  class Cpf
    def validar
      puts 'validado'
    end
  end

  class Cnpj
    def validar
      puts 'validado'
    end
  end
end

Utilidades::Cpf.new.validar

