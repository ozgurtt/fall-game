

class PlayerController

    movespeed: 500


    constructor: (@player, @game)->
        @cursors = game.input.keyboard.createCursorKeys()



    update: ()->
        @player.body.velocity.x = 0

        if (@cursors.left.isDown) &&  @player.x > (Block.block_width+50)
            @player.body.velocity.x = -1* @movespeed
        else if @cursors.right.isDown && @player.x < (@game.world.width - Block.block_width - 50)
            @player.body.velocity.x = @movespeed


