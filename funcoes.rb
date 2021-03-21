require_relative 'humano'
require_relative 'elfo'
require_relative 'anao'
require_relative 'orc'
require 'unicode_utils'
require 'byebug'

def limpa_terminal
  system 'clear'
end

def nao_ha_personagens
  puts '╔═══════════════════════════════════════════════╗'
  puts '║           *** NÃO HÁ PERSONAGENS ***          ║'
  puts '╚═══════════════════════════════════════════════╝'
end

def escolher_personagem

  puts "Personagem" 
  cont=1
  $personagens.each do |persona|
    puts "#{cont})-#{persona.to_s_nome}"
    cont+=1
  end
end

def escolher_classe
  puts "Classe"
  cont=1
  $classes.each do |classe|
    puts "#{cont})-#{classe.to_s}"
    cont+=1
  end
end

def escolher_raca
  puts "Raça"
  listar_racas
  # puts "1) Humano\n2) Elfo\n3) Anão\n4) Orc"
  print '╚► '
  nro_raca = gets.chomp.to_i
  case nro_raca
    when 1
      raca = Humano.new
    when 2
      raca = Elfo.new
    when 3
      raca = Anao.new
    when 4
      raca = Orc.new
    else
      puts 'Opção Inválida!!!'
    end
end

def menu
  limpa_terminal
  puts '╔════════════════════════════════════════════════╗'
  puts '║               J O G O    R P G                 ║'
  puts '╠════╦═══════════════════════════════════════════╣'
  puts '║  1 ║ Cadastrar Personagem                      ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  2 ║ Cadastrar Classe                          ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  3 ║ Treinar Personagem                        ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  4 ║ Listar Classes                            ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  5 ║ Listar Raças                              ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  6 ║ Listar Personagens                        ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  7 ║ Listar Personagens por Raça               ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  8 ║ Listar Personagens por Classe             ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  9 ║ Calcular Força/Ataque Personagem          ║'
  puts '╠════╬═══════════════════════════════════════════╣'
  puts '║  0 ║ Sair do Jogo                              ║'
  puts '╚════╩═══════════════════════════════════════════╝'
 print '  Digite uma opção:► '
end

# byebug
def listar_personagens(raca, classe)
  if $personagens.length!=0
    limpa_terminal
    puts '╔═══════════════════════════════════════════════╗'
    puts '║             ***  PERSONAGENS  ***             ║'
    puts '╚═══════════════════════════════════════════════╝'
    if (raca==0 && classe == 0)
      # byebug
      for personagem in $personagens
        puts personagem.to_s
      end
    elsif (raca!=0 && classe==0)
      # byebug
      puts "Personagens da Raça - #{raca}"
      for personagem in $personagens
      	if personagem.raca.to_s== raca.to_s
      		puts personagem.to_s
      	end
      end
    elsif (raca0=0 && classe!=0)
      classe=$classes[classe.to_i-1]
      puts "Personagens da Classe - #{classe}"

      for personagem in $personagens
      	if personagem.classe.to_s== classe.to_s
      		puts personagem.to_s
      	end
      end
    end
  else
    limpa_terminal
    nao_ha_personagens
  end
end

def press_enter
  puts "\n ► Pressione Enter para continuar..."
  gets()
  limpa_terminal
end

def opcoes(escolha)
  case escolha
    when 1
      limpa_terminal
      cadastrar_personagem
      press_enter
    when 2
      limpa_terminal
      cadastrar_classe
      press_enter
    when 3
      limpa_terminal

      if $personagens.length!=0
        escolher_personagem
        puts "\nEscolha o personagem"
        print "╚► "
        num_person = gets.to_i
        personagens = $personagens[ num_person - 1]
        limpa_terminal
        puts "Personagem à evoluir: #{personagens.to_s_nome}"
        listar_classes
        puts "Escolha uma Classe"
        print '╚► '
        id_classe = gets.chomp.to_i
        classe= $classes[id_classe-1]
        personagens.evoluir(classe)
        puts "Personagem evoluído com sucesso!!!"
      else nao_ha_personagens end
        press_enter
    when 4
      limpa_terminal
      listar_classes
      press_enter
    when 5
      limpa_terminal
      # byebug
      listar_racas
      press_enter
    when 6
      limpa_terminal
      if $personagens.length!=0
        listar_personagens(0,0)
      else nao_ha_personagens end 
        press_enter
    when 7
      limpa_terminal
      if $personagens.length!=0
        raca = escolher_raca
        listar_personagens(raca,0)
      else nao_ha_personagens end 
        press_enter
    when 8
      limpa_terminal
      if $personagens.length!=0
        escolher_classe
        print '╚► '
        classe = gets.chomp
        listar_personagens(0,classe)
      else nao_ha_personagens end 
        press_enter
    when 9
      limpa_terminal

      if $personagens.length!=0
        escolher_personagem
        puts 'Escolha o personagem'
        print '╚► '
        num_person = gets.to_i
        personagens = $personagens[ num_person - 1]
        limpa_terminal
        puts "Personagem : #{personagens.to_s_nome}"

        puts "Força : #{personagens.forca}"
        puts "Ataque: #{personagens.ataque}"

      else nao_ha_personagens end
        press_enter
    when 00
      limpa_terminal
      puts 'Saindo do jogo...'
    else
      limpa_terminal
      puts 'Opção Inválida'
  end
end


def cadastrar_personagem
  puts "     CADASTRE SEU PERSONAGEM"
  puts '     1 - Vou digitar meu Nome'
  puts '     2 - Nome aleatório'
  print '     ╚► '

  optouPor = gets.chomp.to_i
  case optouPor
  when 1
#    limpa_terminal
    nome = gets.chomp
    nome = nome.capitalize
  when 2
    #    limpa_terminal
        nome = Faker::Name.unique.name
  else 
    puts 'Opção Inválida'
  end 

  puts "      Idade"
  print '      ╚► '
  idade = gets.chomp.to_i

  raca=escolher_raca

  # escolher_classe
  listar_classes
  print '      ╚► '

  id_classe = gets.chomp.to_i
  classe= $classes[id_classe-1]

  
#  puts classe.inspect

  $personagem = Personagem.new nome, idade, raca, classe
  # puts '--------------------'
  # puts classe.nome
  # # puts $classes.vida
  # puts '--------------------'

  # $personagem.raca.forca=classe.forca
  
  
  
  $personagens << $personagem
  # puts "#{$personagem.nome}'s Classes:"

  # $personagem.classes.each do |classe|
  #   puts "  #{classe.nome}"
  # end
  
  # puts "#{$personagem.nome}'s Attributes:"
  # puts "  Vida: #{$personagem.vida}"
  # puts "  Ataque: #{$personagem.ataque}"

  puts "Personagem #{nome} criado com sucesso!!!"
end

def treinar_personagem(personagem, classe)
  personagem.train (classe)
end


def classes_default
  $classes = []
  $classe =  Classe.new("Construtor", "Construir Casas")
  $classe << {forca:1, inteligencia:1, vida:-2}
  $classes << $classe

  $classe =  Classe.new("Ferreiro", "Construir espadas e armaduras")
  $classe << {forca:2, ataque:1}
  $classes << $classe

  $classe =  Classe.new("Curandeiro", "Curar outras unidades")
  $classe << {defesa:3, ataque:-1, inteligencia:3}
  $classes << $classe

  $classe =  Classe.new("Guerreiro", "Atacar e defender")
  $classe << {defesa:2, ataque:3, forca:2}
  $classes << $classe
end

def cadastrar_classe
  puts ' Nome: '
  print ' ╚► '
  nome = gets.chomp.to_s

  puts " Habilidade para Classe #{nome}: "
  print '╚► '
  habilidade = gets.chomp.to_s

  begin
    puts 'Adicionar modificador?'
    puts '1-Vida'
    puts '2-Ataque'
    puts '3-Defesa'
    puts '4-Inteligência'
    puts '5-Força'
    puts '6-Nenhum'
    print '╚► '
    escolha = gets.chomp.to_i

    case escolha
      when 1
        puts "Vida: "
        print '╚► '
        vida = gets.to_i
      when 2
        puts "Ataque: "
        print '╚► '
        ataque = gets.to_i
      when 3
        puts "Defesa: "
        print '╚► '
        defesa = gets.to_i
      when 4
        puts "Inteligência: "
        print '╚► '
        inteligencia = gets.to_i
      when 5
        puts "Força: "
        print '╚► '
        forca = gets.to_i
      else
        puts '...'
      end
  end while escolha != 6

  $classe =  Classe.new(nome, habilidade)

  $classe << {vida:vida} if vida != nil
  $classe << {ataque:ataque} if ataque != nil
  $classe << {defesa:defesa} if defesa != nil
  $classe << {inteligencia:inteligencia} if inteligencia != nil
  $classe << {forca:forca} if forca != nil
  $classes << $classe
end

def listar_classes
  puts '╔═══════════════════════════════════════════════════════════╗'
  puts '║                    CLASSES  CADASTRADAS                   ║'
  puts '╚═══════════════════════════════════════════════════════════╝'

  cont = 1
  $classes.each do |valor|
    puts "   ► #{cont} - #{valor.nome} \n         #{valor.modificadores}\n"
    cont += 1
  end
end






