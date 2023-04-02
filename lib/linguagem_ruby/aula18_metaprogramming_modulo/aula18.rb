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
# module Utilidades
#   class Cpf
#     def validar
#       puts 'validado'
#     end
#   end

#   class Cnpj
#     def validar
#       puts 'validado'
#     end
#   end
# end

# Utilidades::Cpf.new.validar

###########################################################################

# usando módulos para injetar códigos em instância
# module Utilidades
#   def validar_cpf
#     puts 'validado!'
#   end

#   def validar_cnpj
#     puts 'validado!'
#   end
# end

# class Cliente
#   include Utilidades
# end

# Cliente.new.validar_cpf

###########################################################################

# usando módulos para injetar códigos em classe
# module Validacoes
#   def validar_cpf
#     puts 'validado!'
#   end

#   def validar_cnpj
#     puts 'validado!'
#   end
# end

# a = 'cassio'
# a.extend Validacoes
# a.validar_cpf

###########################################################################

# também é possível utilizar módulos em tipos como String
# assim toda String terá este método
# module Teste
#   def tirar_espacos
#     gsub(' ', '-')
#   end

#   def imprimir_teste
#     print 'teste'
#   end
# end

# String.include Teste # incluo na instância
# String.extend Teste # incluo na classe

# # puts 'Cassio Roger de Santana'.tirar_espacos
# puts String.imprimir_teste

###########################################################################
# module Validacoes
#   def validar_cpf
#     puts 'validado!'
#   end

#   def validar_cnpj
#     puts 'validado!'
#   end
# end

# module Utilidades
#   def validar_cpf
#     puts 'validado!'
#   end

#   def validar_cnpj
#     puts 'validado!'
#   end
# end

# # neste exemplo abaixo tanto o include quanto extend causam o mesmo efeito
# # devido ao class << self
# class Teste
#   class << self
#     include Validacoes
#   end

#   class Teste
#     extend Utilidades
#   end
# end

###########################################################################
# módulo dentro de módulo
# module InstanciaEClasse
#   def instancia
#     puts 'método de instância'
#   end

#   module Classe
#     def de_classe
#       puts 'método de classe'
#     end
#   end
# end

# class Teste
#   include InstanciaEClasse
#   extend InstanciaEClasse::Classe
# end

# Teste.new.instancia
# Teste.de_classe

###########################################################################
# de uma forma mais poderosa do que a anterior
# podemos definir um método que se responsabiliza para que
# a instancia que receber o include para herdar todos métodos de instãncia
# também receba todos os métodos de classe automáticamente com apenas uma linha de código
module InstanciaEClasse
  def instancia
    puts 'método de instância'
  end

  def self.included(cls)
    cls.extend Classe
  end

  module Classe
    def de_classe
      puts 'método de classe'
    end
  end
end

class Teste
  include InstanciaEClasse
end

Teste.new.instancia
Teste.de_classe