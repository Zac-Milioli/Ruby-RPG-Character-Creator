module RRCFile

    class FormatRRC
        attr_accessor :fileformat, :character
        def initialize(character)
            @character = character
            @fileformat = "---/name/---\n#{@character.name}\n---/type/---\n#{@character.type}\n---/power/---\n#{@character.power}\n---/style/---\n#{@character.style}\n---/description/---\n#{@character.description}" 
        end
    end

    class ExpRRC
        attr_accessor :filepath, :character
        def initialize(character, filepath="exports/")
            @character = character
            @filepath = filepath
        end
        def export_rrc
            body = FormatRRC.new(@character).fileformat
            File.open("#{@filepath}/#{@character.name}_#{@character.type}.rrc", "w") do |file|
                file.write(body)
                file.close()
            end
        end
    end

    class ImpRRC
        include RRCS
        attr_accessor :filepath, :rrcList
        def initialize(filepath="imports/", rrcList)
            @filepath = filepath
            @rrcList = rrcList
        end

        def read_files
            globed = Dir.glob("#{@filepath}*.rrc")
            reglobed = []
            globed.each do |nome|
                reglobed.push(nome.gsub("#{@filepath}", ""))
            end
            return reglobed
        end

        def select_one_file(filename)
            File.open("#{@filepath}#{filename}", "r") do |file|
                bigstring = file.read().gsub("\n", "")
                file.close()
                nome = bigstring.split("---/type/---")[0].gsub("---/name/---", "")
                tipo = bigstring.split("---/type/---")[1].split("---/power/---")[0]
                poder = bigstring.split("---/power/---")[1].split("---/style/---")[0]
                estilo = bigstring.split("---/style/---")[1].split("---/description/---")[0]
                descricao = bigstring.split("---/description/---")[1]
                imported = RRCS::RubyRPGCharacter.new(name=nome, type=tipo, power=poder, style=estilo, description=descricao)
                @rrcList.add_character(character=imported)
            end
        end

        def select_all_files(globed)
            globed.each do |singlefile|
                self.select_one_file(singlefile)
            end
        end
    end
end

