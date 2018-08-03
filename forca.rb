require_relative 'UI' 

def save_rank nome, pontos_totais
    conteudo = "#{nome}\n#{pontos_totais}"
    File.write "rank.txt", conteudo
end


def le_rank
    conteudo = File.read "rank.txt"
    conteudo.split "\n"
end


def sorteia_palavra_secreta
    avisa_escolhendo_palavra
    texto = File.read ("dicionario.txt")
    todas_as_palavras = texto.split "\n"
    numero_escolhido = rand(todas_as_palavras.size)
    palavra_secreta = todas_as_palavras[numero_escolhido].downcase
    avisa_palavra_secreta_escolhida palavra_secreta
end


def palavra_mascarada palavra_secreta, chutes
    mascara = ""
    for letra in palavra_secreta.chars
        if chutes.include? letra
            mascara << letra
        else
            mascara << "_"
        end
    end
    mascara
end


def pede_um_chute_valido chutes, erros, mascara
    cabecalho_de_tentativa chutes, erros, mascara
    loop do
        chute = pede_um_chute 
        if chutes.include? chute
            avisa_chute_efetuado chute
            next
        else
            return chute
        end
    end
end


def joga nome, pontos_totais
    palavra_secreta = sorteia_palavra_secreta

    erros = 0
    chutes = []
    pontos_ate_agora = pontos_totais
    while erros < 5
        mascara = palavra_mascarada palavra_secreta, chutes
        chute = pede_um_chute_valido chutes, erros, mascara
        chutes << chute
        
        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra = chute [0]
            total_encontrado = palavra_secreta.count letra
           
            if total_encontrado == 0 
                avisa_letra_nao_encontrada
                erros += 1
            else
                avisa_letra_encontrada total_encontrado
                pontos_ate_agora += 10
            end    
        else
            if chute == palavra_secreta
                avisa_acertou
                pontos_ate_agora += 100
                break
            else
                avisa_errou
                pontos_ate_agora -= 30
                erros += 1
            end
        end
        avisa_pontos_ate_agora pontos_ate_agora
    end
    avisa_pontos_ate_agora pontos_ate_agora
    pontos_ate_agora    
end


def jogo_da_forca
    nome = da_boas_vindas
    pontos_totais = 0
    avisa_campeao_atual le_rank


    loop do 
        pontos_totais += joga nome, pontos_totais
       
        if le_rank[1].to_i < pontos_totais
            save_rank nome, pontos_totais
        end

        break if nao_jogar_novamente?
    end
end