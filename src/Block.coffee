
class Block extends Phaser.Sprite

    image_key: 'block'
    init_frame: null
    @block_height: 64
    @block_width: 128
    right_side: null

    constructor: (group, x, y, is_left = true)->
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


    update: ()->
        @body.velocity.y = @game.speed


    onOut: ()=>

        blk
        if @y < 0 && @game.speed < 0
            ct = @group.countLiving() - 1
            lst = @group.getAt(ct)

            blk = new Block(@group, @x, Math.floor(lst.y) + Block.block_height)

        else if @y > 0 && @game.speed > 0
            blk = new Block(@group, @x, Math.floor(@group.getFirstAlive().y) - Block.block_height)

        if blk?
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



