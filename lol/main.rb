require 'faraday'

def bem_vindo
    puts "Bem vindo , parça!"
    puts "qual o seu nick no lolzinho?"
    nick = gets.strip
    if nick.include? " "
        nick = nick.gsub! ' ', '%20'
    end
    nick
end

def perfil nick
    
    conn = Faraday.new(:url => 'https://br1.api.riotgames.com/')
    response = conn.get "lol/summoner/v3/summoners/by-name/#{nick}?api_key=RGAPI-c6533dac-7265-4ba3-b420-25a3a391c21d"
    
    File.write "temporario.txt", response.body
    conteudo = File.read "temporario.txt"
    conteudo =  conteudo.gsub! '"', '' 
    conteudo =  conteudo.gsub! '{', ''
    conteudo =  conteudo.gsub! '}', ''
    
    
    conteudo = conteudo.split ","

    if conteudo.size > 2
        puts "Encontramos o seu perfil!"
        puts "\n\n\n\n\n"
        puts conteudo
    else
        puts "qe qe ta rolando"
    end
end


def joga
    nick = bem_vindo
    perfil nick
end

joga




