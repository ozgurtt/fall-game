

class NeonArrow extends NeonSign


    init: ()->
        super()

        @animations.add('glow', [0,1,1,2,2,2,2])
        @animations.play('glow', 10, true);


    getSheet: ()->
        return "glow-arrow"


    update: ()->
        dist = @game.physics.distanceBetween(@, @game.player)
        if dist < 150
            @game.player.getPower(5*@game.time.elapsed)


    getSheetFrames : ()->
        return [0]


