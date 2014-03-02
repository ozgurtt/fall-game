
class Block extends Phaser.Sprite

    image_key: 'block'
    init_frame: null
    @block_height: 80
    @block_width: 128
    right_side: null

    max_frame: 1

    constructor: (group, x, y, is_left = true)->
        @init_frame = group.game.math.getRandom([0..@max_frame])

        super group.game, x, y, @image_key, @init_frame

        group.add(@)


        @is_left = is_left

        @init()

        if @is_left
            @addRight()

        return @


    addRight: ()->
        blk = new Block(@group, @game.width, @y, false)
        blk.scale.setTo(-1, 1)

        @right_side = blk


    init: ()->
        @body.immovable = true

        if @is_left
            @events.onOutOfBounds.add(@onOut)

        @body.velocity.y = @game.speed

    update: ()->
        #if @is_left and @_prevGameSpeed and @_prevGameSpeed isnt @game.speed
        #new Block(@group, @x, Math.floor(@group.getFirstAlive()) - Block.block_height)

        @_prevGameSpeed = @game.speed
        @body.velocity.y = @game.speed


    onOut: ()=>
        blk = null

        ct = @group.countLiving() - 1
        lst = @group.getAt(ct)

        if @y < 0 && @game.speed < 0
            blk = new Block(@group, @x, Math.floor(lst.y) + Block.block_height)

        else if @y >= @game.world.height && @game.speed > 0
            blk = new Block(@group, @x, Math.floor(lst.y) - (Block.block_height))

        if blk?
            if @game.speed < 0
                # Force an update to align stuff correctly
                blk.preUpdate()
                blk.postUpdate()
                blk.right_side.preUpdate()
                blk.right_side.postUpdate()

            @events.onOutOfBounds.removeAll()

            setTimeout ()=>
                @right_side.destroy()
                @destroy()

            , 250



