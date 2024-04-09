module RRBS
    class MyRRBS
        attr_accessor :listing
        def initialize
            @listing = []
        end
    end

    class RubyRPGCharacter
        attr_accessor :name, :type, :power, :style, :description
        def initialize(name="no name", type="No type", power="No power", style="No style", description="No description")    
            @name = name
            @type = type
            @power = power
            @style = style
            @description = description
        end
    end
end