

class PlayerController

    movespeed: 900


    constructor: (@player, @game)->
        @cursors = game.input.keyboard.createCursorKeys()



    update: ()->

        @player.body.velocity.x = 0
        speed = @movespeed

        if @game.input.x + 7 > @player.x && @game.input.x - 7 < @player.x
            speed = 0
        else if @game.input.x + 10 > @player.x && @game.input.x - 10 < @player.x
            speed = .2*@movespeed
        else if @game.input.x + 18 > @player.x && @game.input.x - 18 < @player.x
            speed = .4*@movespeed




        if @game.input.x < @player.x && @player.x > (Block.block_width+50)
            @player.body.velocity.x = -1*speed
        else if (@game.input.x > @player.x) && @player.x < (@game.world.width - Block.block_width - 50)
            @player.body.velocity.x = speed


