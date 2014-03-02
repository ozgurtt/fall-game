

class NeonSign extends FixedObstacle


    init: ()->
        super()
        offset = 30*@scale.x
        @body.setRectangle(@width-offset, @height-offset, offset/2, offset/2)



    update: ()->
        dist = @game.physics.distanceBetween(@, @game.player)
        if dist < 150
            @game.player.getPower(5*@game.time.elapsed)


    getSheetFrames : ()->
        return [0..2]


