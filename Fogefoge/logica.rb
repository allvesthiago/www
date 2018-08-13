require_relative 'UI'

def le_mapa numero
    arquivo =  "mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split "\n"
end


def encontra_jogador mapa
    caracter_do_heroi = "H"
    for linha = 0..(mapa.size-1)
        linha_atual = mapa[linha]
        for coluna = 0..(linha_atual.size-1)
            heroi_esta_aqui = linha_atual[coluna] == caracter_do_heroi
            if heroi_esta_aqui
                #   achei
            end
        end
    end
    #   não achei
end


def joga nome
    mapa = le_mapa 1

    while true
        desenha mapa
        direcao = pede_movimento
    end


end


def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
end
