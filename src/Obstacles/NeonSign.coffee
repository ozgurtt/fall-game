

class NeonSign extends FixedObstacle


    update: ()->
        dist = @game.physics.distanceBetween(@, @game.player)
        if dist < 150
            @game.player.getPower(5*@game.time.elapsed)


    getSheetFrames : ()->
        return [0, 1]

    getSide: ()->
        return Block.block_width

