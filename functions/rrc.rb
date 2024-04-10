module RRCFile

    class FormatRRC
        attr_accessor :fileformat, :character
        def initialize(character)
            @character = character
            @fileformat = "---/name/---\n#{@character.name}\n---/type/---\n#{@character.type}\n---/power/---\n#{@character.power}\n---/style/---\n#{@character.style}\n--/description/--\n#{@character.description}" 
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
        attr_accessor :filepath
    end
end

