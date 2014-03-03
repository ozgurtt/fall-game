
class Player extends Phaser.Sprite

    @player_width: 32
    power: 0

    constructor: (game)->

        x = game.world.centerX
        y = game.world.centerY - 200
        console.log y

        super(game, x, y, 'player', 1)
        @anchor.setTo(0.5, 0.5)
        @controller = new PlayerController(@, game)

        @body.setRectangle(@width-4, @height-4, 2, 2)

        @animations.add('fall')
        @animations.play('fall', 5, true)

        return @


    getPower: (power)->
        @power+= power
        #console.log @power
        # if @power >= 100
        #     @game.speed = 200



    update: ()->
        @controller.update()


