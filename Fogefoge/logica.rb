require_relative 'UI'

def le_mapa numero
    arquivo =  "mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split "\n"
end


def encontra_jogador mapa
    caractere_do_heroi = "H"
    
    for linha = 0..(mapa.size-1)
        linha_atual = mapa[linha]
        coluna_do_heroi = linha_atual.index caractere_do_heroi
        if coluna_do_heroi
            #   achei
        end
    end
end


def joga nome
    mapa = le_mapa 1
    puts "foi até aqui"

    while true
        desenha mapa
        direcao = pede_movimento
    end
end


def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
end

