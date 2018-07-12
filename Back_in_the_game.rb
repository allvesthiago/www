#!/bin/env ruby
# encoding: utf-8

# Jogo da adivinhação
# O jogador tem 5 tentativas pra tentar acertar um número aleatório de 0 a 200

# funções
def da_boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "Qual o seu nome, jogador?"
	nome = gets.strip
	puts "Boa Sorte, #{nome}!"
	puts "\n\n\n"
	nome
end

def pede_dificuldade
	puts "Qual o nivel de dificuldade desejado?"
	puts "1 - Mto fácil; 2 - Fácil; 3 - Médio; 4 - Difícil; 5 - Muito Difícil;"
	dificuldade = gets.to_i
end

def joga nome, dificuldade
	puts
	numero_secreto = sorteia_numero_secreto dificuldade
	limite_de_tentativas = 5
	chutes = []
	pontos_ate_agora = 1000
	
	for tentativa in 1..limite_de_tentativas
		
		chute = repetido chute, chutes, tentativa, limite_de_tentativas
	
		break if cheat nome, pontos_ate_agora
	
		chutes << chute
		pontos_ate_agora = pontuacao chute, numero_secreto, pontos_ate_agora
	
		break if verifica_se_acertou numero_secreto, chute
	
		puts "-------------------------------------------------"
	end
	
	tentativa_bonus numero_secreto, chute, chutes
	puts "Você marcou #{pontos_ate_agora} pontos."
end 

def repetido chute, chutes, tentativa, limite_de_tentativas
	chute = pede_um_numero chutes, tentativa, limite_de_tentativas
	
	if chute == chutes [0] || chute == chutes [1] || chute == chutes [2] || chute == chutes [3] || chute == chutes [4]
		puts "Você já jogou esse número, tente novamente"
		puts
		chute_novo = pede_um_numero chutes, tentativa, limite_de_tentativas
		return chute_novo
	else
		return chute
	end

end

def cheat nome, pontos_ate_agora
	
	if nome == "Thiago M"
		puts "Você acertou!!!"
		puts "Você marcou #{pontos_ate_agora} pontos."
		return true
	end

end

def pontuacao chute, numero_secreto, pontos_ate_agora
	pontos_a_perder = (chute - numero_secreto).abs / 2.0
	pontos_ate_agora = pontos_ate_agora - pontos_a_perder
	return pontos_ate_agora
end

def sorteia_numero_secreto dificuldade
	
	case dificuldade
	when 1 
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end
	
	puts "Escolhendo número secreto entre 0 e #{maximo}"
	sorteado = rand(maximo) + 1
	puts "Escolhido... Vamos tentar adivinhar?"
	sorteado
end

def pede_um_numero chutes, tentativa, limite_de_tentativas
	puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
	puts "Até agora esses foram seus palpites: #{chutes}"
	puts "Qual é o seu palpite?"
	chute = gets.strip

	puts
	puts "Será que você acertou? O seu palpite foi #{chute}..."
	chute.to_i
end

def verifica_se_acertou numero_secreto, chute
	acertou = numero_secreto == chute.to_i
	
	if acertou
		puts "Você acertou!!!"
		return true
	end
	
	maior = numero_secreto > chute.to_i
	
	if maior
		puts "Você quase acertou, o número secreto é maior."
	else
		puts "Você quase acertou, o número secreto é menor."
	end
	
	false
end

def tentativa_bonus numero_secreto, chute, chutes
	diferenca = (chute - numero_secreto).abs == 1
	
	if diferenca
		puts "Você errou por 1 na sua ultima tentativa, por isso este bônus!"
		puts "-----Tentativa BÔNUS-----"
		puts "Até agora esses foram seus palpites: #{chutes}"
		puts "Qual é o seu palpite?"
		chute = gets.strip
		puts
		puts "Será que você acertou? O seu palpite foi #{chute}..."
		chute.to_i
		verifica_se_acertou numero_secreto, chute
	end

end

def nao_jogar_novamente?
	puts "Deseja jogar novamente? (S/N)"
	nao_quero_jogar = gets.strip
	nao_quero_jogar.upcase == "N"
end



#jogo

nome = da_boas_vindas
dificuldade = pede_dificuldade
loop do
	joga nome, dificuldade
	break if nao_jogar_novamente?
end
