

class Main extends Phaser.State
    constructor: -> super

    preload : ()->
        @game.load.image('player', 'assets/Player.png');
        @game.load.image('block', 'assets/Block.png');
        @game.load.atlas('obstacles', 'assets/obstacles/obstacles.png', 'assets/obstacles/obstacles.json')

    create: ()->
        @game.stage.backgroundColor = '#787878';
        @player = new Player(@game)

        @game.add.existing(@player)
        @game.player = @player

        @obstacles = new ObstacleManager(@game)

        ## Test for initial wall setup.
        @sides = @game.add.group()


        @game.speed = -400

        init_blocks = @game.world.height / Block.block_height


        block_placement_y = 0
        for i in [0..Math.ceil(init_blocks)]
            new Block(@sides, 0, block_placement_y)
            block_placement_y += Block.block_height



    update: ()->

        @game.physics.collide(@player, @obstacles, @die)


    render: ()->
        @obstacles.forEachAlive (elem)=>
            @game.debug.renderPhysicsBody(elem.body)


    die: ()=>
        @player.destroy()

        @game.pause()






