package match3.core.controllers;
import match3.ccs.Enums.GameState;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.Errors.NotImplementedError;
import slavara.haxe.core.Interfaces.IStateMachineHolder;
using slavara.haxe.core.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class PanelsController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	var _debug(default, null):PanelController;
	var _settings(default, null):PanelController;
	
	public override function initialize() {
		super.initialize();
		
		var aClass:Class<PanelController> = getDebugType();
		if(aClass.isNotNull()) _debug = Type.createInstance(aClass, [baseController]);
		
		aClass = getSettingsType();
		if(aClass.isNotNull()) _settings = Type.createInstance(aClass, [baseController]);
		
		addListeners();
	}
	
	function getDebugType():Class<PanelController> {
		throw new NotImplementedError();
		return null;
	}
	
	function getSettingsType():Class<PanelController> {
		throw new NotImplementedError();
		return null;
	}
	
	inline function addListeners() {
		cast(data, IStateMachineHolder).stateMachine.onChange.add(onGameStateChange);
	}
	
	inline function onGameStateChange() {
		switch (cast(data, IStateMachineHolder).stateMachine.currentState) {
			case GameState.Loading: _settings.hide();
			case GameState.Intro: _settings.show();
			case GameState.World: _settings.show();
			case GameState.Location: _settings.show();
			case _: _settings.hide();
		}
		_debug.show();
	}
}