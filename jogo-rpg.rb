require_relative 'raca'
require_relative 'personagem'
require_relative 'funcoes'
require_relative 'classe'
require 'byebug'
require 'faker'
require 'unicode_utils'

racas_default()

classes_default()
personagens_default()

# debugger
begin
  menu
  escolha = gets.chomp.to_i
  opcoes(escolha)
end while escolha != 0
