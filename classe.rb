class Classe 
  attr_accessor :nome, :habilidade, :modificadores
  
  def initialize nome, habilidade
    @nome = nome
    @habilidade = habilidade
    @modificadores = {}
  end

  def << valor
    @modificadores.update valor
  end

  def to_s
    "Raça: #{@nome} | Habilidade: #{@habilidade} | Modificadores: #{@modificadores.inspect}"
  end
end



