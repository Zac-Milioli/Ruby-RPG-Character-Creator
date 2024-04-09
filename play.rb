require_relative "functions/character.rb"
require_relative "functions/rrc.rb"
include RRCS
include RRCFile

running = true
instance_rrc = RRCS::MyRRCS.new

while running
    puts "\n"*150
    puts "- "*50
    puts "\nBem vindo ao Ruby RPG Character Creator!\n\nEscolha uma opção\n\n[1] Criar um novo personagem\n[2] Listar personagens\n\n[ENTER] Sair\n"
    puts "- "*50
    selection = gets.chomp()
    case selection
    when ""
        running = false
    when "1"
        creating = true
        new_rrc = RRCS::RubyRPGCharacter.new
        while creating
            puts "\n"*150
            puts "\n\tPersonagem\nNome: #{new_rrc.name}\nTipo: #{new_rrc.type}\nPoder: #{new_rrc.power}\nEstilo: #{new_rrc.style}\n\nDescrição:\n#{new_rrc.description}\n\n"
            puts "- "*50
            puts "\nCriação de personagem\n\nEscolha uma opção para modificar\n\n[1] Nome\n[2] Tipo\n[3] Poder\n[4] Estilo de luta\n[5] Descrição\n\n[0] Salvar e sair\n[ENTER] Cancelar e sair\n"
            puts "- "*50
            opt = gets.chomp()
            case opt
            when "0"
                instance_rrc.add_character(new_rrc)
                creating = false
            when "1"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.name = gets.chomp()
            when "2"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.type = gets.chomp()
            when "3"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.power = gets.chomp()
            when "4"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.style = gets.chomp()
            when "5"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.description = gets.chomp()
            else
                creating = false
            end    
        end
    when "2"
        puts "\n"*150
        puts instance_rrc.listing
        puts "\n\nPressione ENTER para voltar ao menu"
        gets
    else
        puts "\n\nEscolha uma opção válida!"
        puts "Pressione ENTER para voltar ao menu"
        gets
    end
end
