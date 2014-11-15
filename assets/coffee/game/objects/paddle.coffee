define "game/objects/paddle", [], () ->

	# Creates an instance of a paddle object
	class Paddle 

		@currentPosition = 0

		# Preloads the paddle sprite
		#
		# @param {Object} state The current game state
		@preload: (state) ->
			state.load.image 'paddle', 'assets/img/player.png'


		# Initialise a paddle
		#
		# @param {Object} game The current game instance
		# @param {Integer} x The x position of the paddle
		# @param {Integer} y The y position of the paddle
		constructor: (game, x, y) ->

			@game = game
			@currentPosition = y

			@paddle = @game.add.sprite(x, y, 'paddle')
			@game.physics.enable(@paddle, Phaser.Physics.ARCADE)
			@paddle.anchor.setTo(.5,.5)
			@paddle.body.collideWorldBounds = true
			@paddle.body.bounce.setTo(1,1)
			@paddle.body.immovable = true


		# Update the paddle position
		updatePosition: ->
			if @game.input.y < 100
				@paddle.y = 100
			else if @game.input.y > 500
				@paddle.y = 500
			else
				@paddle.y = @game.input.y
