import massive.munit.TestSuite;

import ExampleTest;
import match3.core.controllers.Match3ControllerTest;
import match3.core.controllers.ServerControllerTest;
import match3.core.display.Match3ViewTest;
import match3.core.models.behaviors.BehaviorCollectionDataTest;
import match3.core.models.Match3DataTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(ExampleTest);
		add(match3.core.controllers.Match3ControllerTest);
		add(match3.core.controllers.ServerControllerTest);
		add(match3.core.display.Match3ViewTest);
		add(match3.core.models.behaviors.BehaviorCollectionDataTest);
		add(match3.core.models.Match3DataTest);
	}
}
