module RRCS
    class MyRRCS
        attr_accessor :listing
        def initialize
            @listing = []
        end

        def add_character(character)
            @listing.push(character)
        end

        def find_character(name)
            @listing.find {|character| character.name == name}
        end
    end

    class RubyRPGCharacter
        attr_accessor :name, :type, :power, :style, :description
        def initialize(name="No name", type="No type", power="No power", style="No style", description="No description")    
            @name = name
            @type = type
            @power = power
            @style = style
            @description = description
        end

        def to_s
            "#{@name}, #{@type}"
        end
    end
end