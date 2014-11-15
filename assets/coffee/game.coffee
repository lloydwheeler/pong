define "game", ["states/main"], (Main) ->
	
	class Game extends Phaser.Game

		constructor: ->
			super 800, 600, Phaser.AUTO, '', null

			@state.add 'Main', Main
			@state.start 'Main'
