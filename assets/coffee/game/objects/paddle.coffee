define "game/objects/paddle", [], () ->

	# Creates an instance of a paddle object
	class Paddle extends Phaser.Sprite


		# Preloads the paddle sprite
		#
		# @param {Object} state The current game state
		@preload: (state) ->
			state.load.image 'paddle', 'assets/img/paddle.png'


		# Initialise a paddle
		#
		# @param {Object} game The current game instance
		# @param {Integer} x The x position of the paddle
		# @param {Integer} y The y position of the paddle
		constructor: (game, x, y) ->

			@game = game

			super(@game, x, y, 'paddle')
			



			@game.physics.arcade.enable(this)
			this.anchor.setTo(.5,.5)
			this.body.collideWorldBounds = true
			this.body.bounce.setTo(1,1)
			this.body.immovable = true


		# Update the paddle position
		updatePosition: ->

			if @game.input.y < 100
				this.y = 100
			else if @game.input.y > 500
				this.y = 500
			else
				this.y = @game.input.y
