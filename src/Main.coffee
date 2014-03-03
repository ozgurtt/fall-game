

class Main extends Phaser.State
    constructor: -> super

    preload : ()->
        @game.load.image('scoreframe', 'assets/ScoreFrame.png')
        @game.load.image('backdrop', 'assets/Backdrop.png')
        @game.load.spritesheet('block', 'assets/Block.png', 128, 80);
        @game.load.spritesheet('player', 'assets/Player.png', 32, 48);
        @game.load.image('logo2', 'assets/Logo.png')
        @game.load.atlas('obstacles', 'assets/obstacles/obstacles.png', 'assets/obstacles/obstacles.json')
        @game.load.spritesheet('glow-arrow', 'assets/obstacles/GlowArrow.png', 112, 201)



    create: ()->
        backdrop = @game.add.sprite(0, 0,'backdrop')

        @game.blocks_passed = 0
        @started = false

        style = { font: "20px Arial", fill: "#65dfff", align: "left" };


        @player = new Player(@game)
        @player.visible = false
        @game.add.existing(@player)
        @game.player = @player


        @startText = @game.add.text(5, 10,
            "In the year 20XX, corporations control the world's government.\n" +
            "You are a member of a covert resistance who aims to topple\n" +
            "the corrupt corporate government.\n" +
            "\n" +
            "You broke into a corporate headquarter at the top of a super\n" +
            "skyscraper and planted a virus that would destroy Civil Surveillance.\n\n\n\n" +
            "Unfortunately, you were spotted by security and had to improvise \n" +
            "an escape plan.\n" +
            "\n" +
            "Unfortunately, you aren't good at improvising.\n\n\n\n\n"+
            "Press ENTER to begin" , style);




    startGame: ()->
        @player.visible = true
        @sides = @game.add.group()
        @obstacles = new ObstacleManager(@game)
        #@obstacles = @game.add.group()

        ## Test for initial wall setup.


        @game.speed = -550

        logo = @game.add.sprite(40, @game.world.height + 800, 'logo2')
        logo.body.velocity.y = @game.speed

        logo.events.onOutOfBounds.add ()=>
            if logo.y < 0
                logo.events.onOutOfBounds.removeAll()
                setTimeout ()->
                    logo.destroy()
                ,50
                @obstacles.initializeTimers()


        init_blocks = @game.world.height / Block.block_height


        block_placement_y = 0
        for i in [0..Math.ceil(init_blocks)]
            new Block(@sides, 0, block_placement_y)
            block_placement_y += Block.block_height

        @speedTimer = @game.time.events.loop(2000, @increaseSpeed)


        @game.add.sprite(0, 0, 'scoreframe')
        style = { font: "19px Arial", fill: "#65dfff", align: "left" };

        @score_text = @game.add.text(25, 17, "0", style);
        @started = true


    update: ()->
        if not @started
            if @input.keyboard.justPressed(Phaser.Keyboard.ENTER)
                console.log "BLAREUH"
                @startText.destroy()
                @startGame()
                console.log @player.y

        else
            @game.physics.collide(@player, @obstacles, @die)

            speed = ((@game.blocks_passed*12)/(@game.time.time/1000))
            @score_text.content = @game.blocks_passed + " stories\n" +
                speed.toFixed(1)+" ft/s"



    increaseSpeed: ()=>
        @game.speed -= 25
        if Math.abs(@game.speed) > 1000
            @game.time.events.remove(@speedTimer)


    # render: ()->
    #     @obstacles.forEachAlive (elem)=>
    #         @game.debug.renderPhysicsBody(elem.body)

    #     @game.debug.renderPhysicsBody(@player.body)


    die: ()=>
        @player.killed = true
        #@player.destroy()
        # @game.pause()






