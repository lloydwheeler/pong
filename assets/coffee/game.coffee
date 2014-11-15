define "game", ["states/boot"], (Boot) ->
	
	class Game extends Phaser.Game

		constructor: ->
			super 800, 600, Phaser.AUTO, '', null

			@state.add 'Boot', Boot
			@state.start 'Boot'
