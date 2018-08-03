def da_boas_vindas
    puts "Bem-vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}!"
    nome
end


def avisa_campeao_atual dados
    puts "Nosso atual campeão: #{dados [0]} com #{dados [1]}"
end


def avisa_escolhendo_palavra
    puts "Escolhendo uma palavra..."
end


def avisa_palavra_secreta_escolhida palavra_secreta
    puts "Escolhida uma palavra com #{palavra_secreta.size} letras... Boa sorte!"
    palavra_secreta
end


def cabecalho_de_tentativa chutes, erros, mascara
    puts "\n\n\n\n"
    puts "Palavra Secreta: #{mascara}"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
end


def pede_um_chute 
    puts "Entre com uma letra ou palavra"
    chute = gets.strip.downcase
    puts "Será que acertou? Você chutou #{chute}."
    chute
end


def avisa_chute_efetuado chute
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


def nao_jogar_novamente?
	puts "Deseja jogar novamente? (S/N)"
	nao_quero_jogar = gets.strip
	nao_quero_jogar.upcase == "N"
end