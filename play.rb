require "functions/character.rb"
require "functions/rrc.rb"
include RRBS
include RRCFile

running = true

while running
    puts "\n"*50
    puts "- "*50
    puts "\nBem vindo ao Ruby RPG Character Creator!\n\nEscolha uma opção\n\n[ENTER] Sair\n"
    puts "- "*50
    selection = gets.chomp()
    if selection == ""
        running = false
    end
end
