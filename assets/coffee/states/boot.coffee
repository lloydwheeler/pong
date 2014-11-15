define "states/boot", ["game/objects/paddle", "game/objects/ball"], (Paddle, Ball) ->
	
	# Preloads all assets and creates the gameworld objects
	class Boot extends Phaser.State


		# Preloads all image assets
		preload: ->
			Paddle.preload(this)
			Ball.preload(this)


		# Create our gameworld objects
		create: ->
			@player = new Paddle(@game, 20, game.world.centerY - 100)
			@ai = new Paddle(@game, game.width - 20, game.world.centerY - 100)
			@ball = new Ball(@game, game.world.centerX, game.world.centerY)



			@ball.releaseBall()
			# Release the ball
			# @game.input.onDown.add(ball.releaseBall(), this)


		# Updates the game world
		update: ->
			@player.updatePosition()
			# console.log @game.physics.collide(@ball, @player, null)
			# 	console.log "collide"


		# Changes the direction of the ball on collision
		ballCollision: ->
			console.log "collision"