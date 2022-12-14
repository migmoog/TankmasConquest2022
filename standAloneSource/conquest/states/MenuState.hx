package conquest.states;

import flixel.text.FlxText;

import ui.Controls;

import utils.Global;

class MenuState extends flixel.FlxState
{
	override function create()
	{
		super.create();
		
		// Only needs to be called once
		Controls.init();
		
		final info = new FlxText();
		info.alignment = CENTER;
		info.text = "Made by michael moog";
		Global.screenCenter(info);
		add(info);
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		if (Controls.justPressed.A)
			Global.switchState(new conquest.states.PlayState());
	}
}