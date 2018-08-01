require_relative 'UI' 

def pede_um_chute_valido chutes, erros
    cabecalho_de_tentativa chutes, erros
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


def joga nome
    palavra_secreta = sorteia_palavra_secreta

    erros = 0
    chutes = []
    pontos_ate_agora = 0
    while erros < 5
        chute = pede_um_chute_valido chutes, erros
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
    
end

def jogo_da_forca
    nome = da_boas_vindas

    loop do 
        joga nome
        break if nao_jogar_novamente?
    end
end