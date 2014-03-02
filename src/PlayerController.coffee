

class PlayerController

    movespeed: 450


    constructor: (@player, @game)->
        @cursors = game.input.keyboard.createCursorKeys()



    update: ()->

        @player.body.velocity.x = 0

        if (@game.input.x < @player.x - 10) && @player.x > (Block.block_width+50)
            @player.body.velocity.x = -1*@movespeed

        else if (@game.input.x > @player.x+10) && @player.x < (@game.world.width - Block.block_width - 50)
            @player.body.velocity.x = @movespeed


