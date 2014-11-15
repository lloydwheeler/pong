define "game/objects/ball", ["game/settings"], (Settings) ->

	# Creates an instance of a ball object
	class Ball

		@isMoving = false

		# Preloads the ball sprite
		#
		# @param {Object} state The current game state
		@preload: (state) ->
			state.load.image 'ball', 'assets/img/ball.png'


		# Initialise the ball
		constructor: (game, x, y) ->
			@ball = game.add.sprite(x, y, 'ball')
			game.physics.enable(@ball, Phaser.Physics.ARCADE)
			@ball.anchor.setTo(.5,.5)
			@ball.body.collideWorldBounds = true
			@ball.body.bounce.setTo(1,1)


		# Release the ball
		releaseBall: ->
			console.log "releasing ball"
			unless @isMoving
				@ball.body.velocity.x = Settings.ballSpeed
				@ball.body.velocity.y = -Settings.ballSpeed
				@isMoving = true