# definição da classe Raça e seus atributos
class Raca
  attr_accessor :nome, :vida, :ataque, :defesa, :inteligencia, :forca

  def initialize(nome, vida, ataque, defesa, inteligencia, forca)
      @nome = nome
      @vida = vida
      @ataque = ataque
      @defesa = defesa
      @inteligencia = inteligencia
      @forca = forca
  end

  def to_s
    "#{@nome}"
  end

  def to_s_atributos
    "Nome: #{@nome} - Vida: #{@vida} - Ataque: #{@ataque} - Defesa: #{@defesa} - Inteligência: #{@inteligencia} - Força: #{@forca}"
  end  
end

def racas_default()
$racas = []
$raca = Raca.new("Humano", 20, 8, 8, 10, 10)
$racas << $raca

$raca = Raca.new("Elfo", 25,5, 6, 20, 10)
$racas << $raca

$raca = Raca.new("Anao", 18, 9, 11, 7, 20)
$racas << $raca

$raca = Raca.new("Orc", 15, 12, 5, 2, 25)
$racas << $raca
end

def listar_racas
puts '╔═══════════════════════════════════════════════╗'
puts '║               RACAS  CADASTRADAS              ║'
puts '╚═══════════════════════════════════════════════╝'
# byebug
cont = 1
$racas.each do |valor|
  puts "   ► #{cont} - #{valor}"
  cont += 1
end
end
