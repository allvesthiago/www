def avisa_chute_repetido chute
    puts "Você já chutou #{chute}."
end

def avisa_letra_nao_encontrada
    puts "Letra não encontrada na palavra secreta."
end

def avisa_letra_encontrada total_encontrado
    puts "Letra encontrada #{total_encontrado} vezes."
end

def avisa_acertou
    puts "Você acertou, Parabéns!"
end

def avisa_errou
    puts "Que pena... Você errou!"
end

def avisa_pontos_ate_agora pontos_ate_agora
    puts "Você ganhou #{pontos_ate_agora} pontos até agora!"
end

def da_boas_vindas
    puts "Bem-vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}!"
    nome
end

def sorteia_palavra_secreta
    puts "Escolhendo uma palavra..."
    palavra_secreta = "programador"
    puts "Escolhida uma palavra com #{palavra_secreta.size} letras... Boa sorte!"
    palavra_secreta
end

def nao_jogar_novamente?
	puts "Deseja jogar novamente? (S/N)"
	nao_quero_jogar = gets.strip
	nao_quero_jogar.upcase == "N"
end

def pede_um_chute chutes, erros
    puts "\n\n\n\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com uma letra ou palavra"
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute}."
    chute
end
