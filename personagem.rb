class  Personagem 
  attr_accessor :nome, :idade, :raca, :classes

  def initialize nome, idade, raca, classe
    @nome = nome
    @idade = idade
    @raca = raca
    @classes = []

    # @vida = raca.vida 
		# @ataque = raca.ataque
		# @defesa = raca.defesa
		# @inteligencia = raca.inteligencia
		# @forca = raca.forca

    evoluir(classe)
  end

  def evoluir(classe)
    @classes << classe
  end

  def attribute(symbol)
    @classes.reduce(0) { |sum, classe| sum + (classe.modificadores[symbol] || 0) }
  end

  def vida
    @raca.vida + attribute(:vida)
  end

  def ataque
    @raca.ataque + attribute(:ataque)
  end

  def defesa
    @raca.defesa + attribute(:defesa)
  end

  def inteligencia
    @raca.inteligencia + attribute(:inteligencia)
  end

  def forca
    @raca.forca + attribute(:forca)
  end

  def to_s_nome
    "#{@nome}"
  end

  def to_s
    print " Nome        : #{@nome} \n Idade       : #{@idade} \n Raça        : #{@raca.to_s_atributos}\n"
    puts " Classes:"
    classes.each do |classe|
      puts " #{classe.nome} \n   Modificadores: #{classe.modificadores}"
    end

    puts " Vida        : #{vida}"
    puts " Ataque      : #{ataque}"
    puts " Defesa      : #{defesa}"
    puts " Inteligência: #{inteligencia}"
    puts " Força       : #{forca}"

    # puts @classes.inspect
    # puts "#{personagem.nome}'s Classes:"
    # personagem.classes.each do |classe|
    #   puts "  #{classe.title}"
    # end
    
    # puts "#{character.name}'s Attributes:"
    # puts "  Life: #{character.attribute(:life)}"
    # puts "  Attack: #{character.attribute(:attack)}"
    
  end
end

def personagens_default
  $personagens=[]
  
  humano = Humano.new
  elfo = Elfo.new
  anao = Anao.new
  orc = Orc.new

  classe= $classes[0]
  $personagem = Personagem.new Faker::Name.unique.name, 30, humano, classe
  $personagens << $personagem

  classe= $classes[1]
  $personagem = Personagem.new Faker::Name.unique.name, 20, elfo, classe
  $personagens << $personagem

  classe= $classes[2]
  $personagem = Personagem.new Faker::Name.unique.name, 15, anao, classe
  $personagens << $personagem

  classe= $classes[3]
  $personagem = Personagem.new Faker::Name.unique.name, 30, orc, classe
  $personagens << $personagem
end
