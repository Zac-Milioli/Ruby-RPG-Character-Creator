require_relative "functions/character.rb"
require_relative "functions/rrc.rb"
include RRCS
include RRCFile

running = true
instance_rrc = RRCS::MyRRCS.new

while running
    puts "\n"*150
    puts "Bem vindo ao Ruby RPG Character Creator!"
    puts "- "*50
    puts "\n\nEscolha uma opção\n\n[1] Criar um novo personagem\n[2] Listar e selecionar personagens\n\n[ENTER] Sair\n\n"
    puts "- "*50
    selection = gets.chomp
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
            puts "\nCriação de personagem\n\nEscolha uma opção para modificar\n\n[1] Nome\n[2] Tipo\n[3] Poder\n[4] Estilo de luta\n[5] Descrição\n\n[0] Salvar e sair\n[ENTER] Cancelar e sair\n\n"
            puts "- "*50
            opt = gets.chomp
            case opt
            when "0"
                instance_rrc.add_character(new_rrc)
                creating = false
            when "1"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.name = gets.chomp.gsub(".", "").gsub("/", "").gsub(";", "").gsub(",", "").gsub(":", "").gsub("<", "").gsub(">", "").gsub("\\", "")
            when "2"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.type = gets.chomp.gsub(".", "").gsub("/", "").gsub(";", "").gsub(",", "").gsub(":", "").gsub("<", "").gsub(">", "").gsub("\\", "")
            when "3"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.power = gets.chomp
            when "4"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.style = gets.chomp
            when "5"
                puts "\n"*150
                puts "Digite o que quiser. Aperte ENTER para salvar."
                puts "- "*50
                new_rrc.description = gets.chomp
            else
                creating = false
            end    
        end
    when "2"
        puts "\n"*150
        puts "\tPersonagens salvos"
        puts "- "*50
        puts instance_rrc.listing
        puts "- "*50
        puts "\n\nPressione ENTER para voltar ao menu, ou digite\nexatamente o NOME de algum personagem para selecioná-lo\n"
        character_selected = instance_rrc.find_character(gets.chomp)
        if character_selected != nil && character_selected != ""
            creating = true
            while creating
                puts "\n"*150
                puts "\n\tPersonagem\nNome: #{character_selected.name}\nTipo: #{character_selected.type}\nPoder: #{character_selected.power}\nEstilo: #{character_selected.style}\n\nDescrição:\n#{character_selected.description}\n\n"
                puts "- "*50
                puts "\nAções de personagem\n\nEscolha uma opção para modificar ou executar\n\n[1] Nome\n[2] Tipo\n[3] Poder\n[4] Estilo de luta\n[5] Descrição\n\n[0] Exportar personagem\n[ENTER] Sair\n\n"
                puts "- "*50
                opt = gets.chomp
                case opt
                when "0"
                    RRCFile::ExpRRC.new(character=character_selected).export_rrc
                    creating = false
                when "1"
                    puts "\n"*150
                    puts "Digite o que quiser. Aperte ENTER para salvar."
                    puts "- "*50
                    character_selected.name = gets.chomp.gsub(".", "").gsub("/", "").gsub(";", "").gsub(",", "").gsub(":", "").gsub("<", "").gsub(">", "").gsub("\\", "")
                when "2"
                    puts "\n"*150
                    puts "Digite o que quiser. Aperte ENTER para salvar."
                    puts "- "*50
                    character_selected.type = gets.chomp.gsub(".", "").gsub("/", "").gsub(";", "").gsub(",", "").gsub(":", "").gsub("<", "").gsub(">", "").gsub("\\", "")
                when "3"
                    puts "\n"*150
                    puts "Digite o que quiser. Aperte ENTER para salvar."
                    puts "- "*50
                    character_selected.power = gets.chomp
                when "4"
                    puts "\n"*150
                    puts "Digite o que quiser. Aperte ENTER para salvar."
                    puts "- "*50
                    character_selected.style = gets.chomp
                when "5"
                    puts "\n"*150
                    puts "Digite o que quiser. Aperte ENTER para salvar."
                    puts "- "*50
                    character_selected.description = gets.chomp
                else
                    creating = false
                end    
            end  
        end
    else
        puts "\n\nEscolha uma opção válida!"
        puts "Pressione ENTER para voltar ao menu"
        gets
    end
end
