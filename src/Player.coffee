
class Player extends Phaser.Sprite

    @player_width: 64
    power: 0

    constructor: (game)->

        x = game.world.centerX
        y = game.world.centerY - 200

        super(game, x, y, 'player')
        @anchor.setTo(0.5, 0.5)
        @controller = new PlayerController(@, game)


        return @


    getPower: (power)->
        @power+= power
        #console.log @power
        # if @power >= 100
        #     @game.speed = 200



    update: ()->
        @controller.update()


