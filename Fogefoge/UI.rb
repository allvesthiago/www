  def da_boas_vindas
    puts "Bem vindo ao Foge foge!"
    puts "Qual o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n"
    puts "Começaremos o jogo pra você, #{nome}"
    nome
end


def desenha mapa
    puts mapa
end


def pede_movimento
    puts "para onde deseja ir?"
    movimento = gets.strip.upcase
    movimento
end
