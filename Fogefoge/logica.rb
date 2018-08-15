require_relative 'UI'

def le_mapa numero
    arquivo =  "mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split "\n"
end


def encontra_jogador mapa
    caracter_do_heroi = "H"
    
    for linha = 0..(mapa.size -1)
        linha_atual = mapa[linha]
        coluna_atual = linha_atual.index caracter_do_heroi
        if heroi_esta_aqui
            #   achei
        end
    end
    #   não achei
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

