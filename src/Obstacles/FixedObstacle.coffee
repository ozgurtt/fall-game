

class FixedObstacle extends Phaser.Sprite

    constructor: (@game)->
        frame = @getRandomFrame()
        x = @getSide()
        super(@game, x, @game.world.height, @getSheet(), frame)
        @adjustPlacement()

        @body.velocity.y = @game.speed

        @body.immovable = true
        @body.rebound = false

        @init()

    init: ()->



    adjustPlacement: ()->
        @anchor.setTo(0.5, 0.5)
        @x = @x+@width/2

    getSheet: ()-> return 'obstacles'

    # Returns what frames from the atlas/spritesheet
    # this obstacle draws from
    getSheetFrames: ()-> return []


    getRandomFrame: ()->
        frames = @getSheetFrames()

        return @game.math.getRandom(frames)


    getSide: ()->
        return @game.math.getRandom([Block.block_width, @game.world.width - Block.block_width])
