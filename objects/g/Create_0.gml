InitializeGame();
InitializeGameStateMachine();

/// Startup Editor state
StateSwitch("Editor");

prevoffset = 1;
roomspd = 60; // used for debugging throttle button. it stores the current speed to restore when the key is released
