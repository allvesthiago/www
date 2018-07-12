#!/bin/env ruby
# encoding: utf-8

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

def joga nome
    palavra_secreta = sorteia_palavra_secreta

    erros = 0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        chute = pede_um_chute chutes, erros
        chutes << chute
        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
        
        else
            if chute == palavra_secreta
                puts "Você acertou, Parabéns!"
                pontos_ate_agora += 100
                break
            else
                puts "Que pena... Você errou!"
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    puts "Você ganhou #{pontos_ate_agora} pontos até agora!"
    end
end


# laço principal 
nome = da_boas_vindas

loop do 
    joga nome
    break if nao_jogar_novamente?
end
