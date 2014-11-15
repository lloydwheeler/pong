define "game/objects/ball", ["game/settings"], (Settings) ->

	# Creates an instance of a ball object
	class Ball extends Phaser.Sprite

		@isMoving = false

		# Preloads the ball sprite
		#
		# @param {Object} state The current game state
		@preload: (state) ->
			state.load.image 'ball', 'assets/img/ball.png'


		# Initialise the ball
		#
		# @param {Object} game The current game
		# @param {Integer} x The default x position
		# @param {Integer} y The default y position
		constructor: (game, x, y) ->
			@game = game
			super(@game, x, y, 'ball')
			@game.physics.arcade.enable(this)
			this.anchor.setTo(.5, .5)
			this.body.collideWorldBounds = true
			this.body.bounce.setTo(1, 1)


		# Release the ball
		releaseBall: ->
			unless @isMoving
				this.body.velocity.x = Settings.ballSpeed
				this.body.velocity.y = -Settings.ballSpeed
				@isMoving = true


		# Checks to see if a goal has been scored
		checkGoal: ->
			if this.x < 15
				console.log "goal!"
				this.body.velocity.x = Settings.ballSpeed
				this.body.velocity.y = -Settings.ballSpeed
				@resetPosition()


		# Resets the ball to its default position once a goal has been scored
		resetPosition: ->
			this.x = @game.world.centerX
			this.y = @game.world.centerY


		# Increases the velocity of the ball after every collision
		increaseVelocity: ->
			this.body.velocity.y += Settings.velocityIncrease
			this.body.velocity.x += Settings.velocityIncrease