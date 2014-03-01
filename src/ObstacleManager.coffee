

class ObstacleManager extends Phaser.Group


    constructor: (args...)->
        super(args...)
        @init()
        @type = Phaser.GROUP

        return @

    init: ()->
        @game.time.events.loop(1000, @spawnObstacle)


    spawnObstacle: ()=>

        ob = new NeonSign(@game)
        @add(ob)

        ob.events.onOutOfBounds.addOnce(@destroyObstacle, ob)


    destroyObstacle: (ob)=>
        setTimeout ()=>
            ob.destroy()
        , 50
