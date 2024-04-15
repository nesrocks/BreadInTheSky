///Setup State Machine for Game
function InitializeGameStateMachine() {
	StateMachineInit();


	//Define States
	StateCreate("Editor",StateEditor);

	//Set the default state
	StateInit("Editor");


}
