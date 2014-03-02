

class ObstacleManager extends Phaser.Group

    timers: false
    min_time: 700
    max_time: 3000

    constructor: (args...)->
        super(args...)
        @init()
        @type = Phaser.GROUP

        return @

    init: ()->


    update: ()->
        if @timers
            if @game.time.now - @prev_spawn  > @interval
                @spawnObstacle()


    initializeTimers: ()->
        @generateTime()
        @game.time.events.add(@interval, @spawnObstacle)


    generateTime:()->
        diff = Math.random()*(@max_time - @min_time)

        @interval = @min_time+diff
        @prev_spawn = @game.time.now



    spawnObstacle: ()=>
        @initializeTimers()


        if Math.random() > 0.5
            ob = new NeonSign(@game)
        else
            ob = new NeonArrow(@game)
        @add(ob)

        ob.events.onOutOfBounds.addOnce(@destroyObstacle, ob)


    destroyObstacle: (ob)=>
        if ob.y < 0

            setTimeout ()=>
                ob.destroy()
            , 50
