define "states/main", ["game/objects/paddle", "game/objects/ball"], (Paddle, Ball) ->
	
	# Preloads all assets and creates the gameworld objects
	class Main extends Phaser.State

		ball = ""


		# Preloads all image assets
		preload: ->
			Paddle.preload(this)
			Ball.preload(this)


		# Create our gameworld objects
		create: ->
			# Add our player
			@player = new Paddle(@game, 20, game.world.centerY - 100)
			@world.add(@player)

			# Add the AI
			@ai = new Paddle(@game, game.width - 20, game.world.centerY - 100)
			@world.add(@ai)

			# Add and release the ball
			ball = new Ball(@game, game.world.centerX, game.world.centerY)
			@world.add(ball)
			@game.physics.startSystem(Phaser.Physics.ARCADE)
			ball.releaseBall()




		# Updates the game world
		update: ->
			@player.updatePosition()
			ball.checkGoal()
			@game.physics.arcade.collide(ball, @player, @ballCollision)
			


		# Changes the direction of the ball on collision
		ballCollision: ->
			ball.increaseVelocity()