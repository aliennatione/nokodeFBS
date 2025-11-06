
{ pkgs, ... }: {
  # Use a stable channel for Nix packages
  channel = "stable-24.05";

  # Packages needed for this project
  packages = [
    pkgs.nodejs_20  # Node.js version 20
  ];

  # Environment variables
  env = {
    # The .env file will override this, but it's good practice
    # to have defaults here.
    LLM_PROVIDER = "gemini";
    GEMINI_MODEL = "gemini-pro";
  };

  # VS Code extensions to install
  idx.extensions = [
    "dbaeumer.vscode-eslint"  # For JavaScript linting
  ];

  # Workspace lifecycle hooks
  idx.workspace = {
    # Runs when the workspace is first created
    onCreate = {
      # Install npm dependencies, using --legacy-peer-deps to avoid conflicts
      install-deps = "npm install --legacy-peer-deps";
    };

    # Runs every time the workspace is (re)started
    onStart = {
      # Start the development server
      start-server = "npm start";
    };
  };

  # Web preview configuration
  idx.previews = {
    enable = true;
    previews = {
      # Name of the preview tab
      web = {
        # The command to start the server. It will use the port provided
        # by the environment variable $PORT.
        command = ["npm", "start"];
        manager = "web";
        # The port the application will listen on
        port = 3001;
      };
    };
  };
}
