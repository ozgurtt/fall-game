

class FixedObstacle extends Phaser.Sprite

    constructor: (@game)->
        frame = @getRandomFrame()
        x = @getSide()
        super(@game, x, @game.world.height+300, @getSheet(), frame)
        # @scale.x = @game.math.clamp(Math.random() * 1.3, 0.75, 1.3)
        # @scale.y = @scale.x

        @adjustPlacement()


        @body.velocity.y = @game.speed

        @body.immovable = true
        @body.rebound = false

        @init()

    init: ()->


    adjustPlacement: ()->
        @anchor.setTo(0.5, 0.5)
        if @x < @game.world.width/2
            @x = @x+@width/2
        else
            @x = @x-@width/2


    getSheet: ()-> return 'obstacles'

    # Returns what frames from the atlas/spritesheet
    # this obstacle draws from
    getSheetFrames: ()-> return []


    getRandomFrame: ()->
        frames = @getSheetFrames()

        return @game.math.getRandom(frames)


    getSide: ()->
        return @game.math.getRandom([Block.block_width-15, @game.world.width - Block.block_width+15])
