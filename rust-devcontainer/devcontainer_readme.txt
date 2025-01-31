1. Install Docker Desktop.
2. Install VS Code.

3. Install following Extensions :
   Execute following commands from terminal on Ubuntu or from Powershell on Windows

   code --install-extension ms-azuretools.vscode-docker
   code --install-extension ms-vscode-remote.vscode-remote-extensionpack
   code --install-extension ms-vscode-remote.remote-containers
   code --install-extension redhat.vscode-yaml

  Verify installation.
  code --list-extensions  # List all installed extensions
  code --list-extensions | wc -l  # Count the number of installed extensions (should be 9)

-----------------------------------------------------------------------------------------------

Create a folder 'rustprograms'. I am creating folder with this name. You can give any other name.

Clone the repo to the rustprograms folder and proceed with devcontainer set-up.

-----------------------------------------------------------------------------------------------

Setting Up the Development Container:

1. Run the Initialization Script:

   Execute the init.sh script before building the Docker image. 
   This script performs essential setup tasks within the container.
   
# Note : Take back-up of previous history and rust_programs directory before building new image.

1.1. Open a terminal window in .devcontainer directory.

1.2. Make the init.sh and post-create.sh scripts executable using the following commands:

chmod +x init.sh 
chmod +x post-create.sh

1.3 Run the initialization script:

./init.sh


2. Open VS Code and the Project Folder:

    Open VS Code.
    Open the rustprograms folder from within VS Code.

3. Open the Development Container:

    Press F1 to open the VS Code command palette.
    Select the command "Dev Containers: Open Folder in Container...".
    This command will build docker image and spin-up the container.


4. Run the Post-Creation Script (Optional):

   Open new ZSH Shell terminal window of VS-Code.

   Execute post-create.sh script.

➜ workspace      cd .devcontainer             
➜ .devcontainer  ./post-create.sh


** Rebuilding the Development Container:

   If you modify the dockerfile, docker-compose.yml, or devcontainer.json files, follow these steps to rebuild the container:
   
    
    Stop and remove container, remove previous image.
    Take back-up of previous history and rust_programs directory before building new image.
    
    In VS Code, open the command palette (press F1).

    select DevContainers: Dev Containers: Open Folder in Container...""
    Select rustprograms folder or folder containing '.devcontainer' folder, from folder browser dialogue. 

---------------------------------------------------------------------------------------------------------------------------
## Debugging with Visual Studio Code

The `.vscode/launch.json` file contains debugger configurations. You can customize these configurations to match your specific debugging needs. Here's how to get started:

1. **Update Executable Path:**
   - Open the `.vscode/launch.json` file.
   - Locate the `"program"` property within the launch configuration you want to use.
   - Update the path specified by `"program"` to point to the exact executable file (e.g., `.out' file) you want to debug.

   e.g. 
   // Executable which you want to debug.
   "program": "${workspaceFolder}/rust_programs/hello_world/target/debug/hello_world",
   
   //**** Here each time for new project hello_world is replaced by project name.         
-----------------------------------------------
2. **Configure Rust Analyzer:**
   - The `.rust-project.json` file provides settings for the Rust analyzer extension.
   - To enable code completion and other language features, edit the `"root_module"` property within the `.rust-project.json` file.
   - Set `"root_module"` to the path of your project's `main.rs` file.
      e.g. 
{

  "crates": [
    {
      
      "root_module": "./rust_programs/hello_world/src/main.rs",
      "edition": "2021",
      "deps": []
    }
  ]
}
  //**** Here each time for new project hello_world is replaced by project name.         
-----------------------
   - If rust-analyzer fails with Error as 
      Failed to discover workspace. Consider adding the Cargo.toml of the workspace to the linkedProjects setting. 
    Then, in VS-Code select File -> Preferences -> Settings Search for linkedProjects -> Edit in settings.json 
    settings.json will be opened, there add path for projects Cargo.toml 
    
    e.g.

    {
    "rust-analyzer.linkedProjects": [
        "rust_programs/hello_world/Cargo.toml"
    ]
}          

//**** Here each time for new project hello_world is replaced by project name.
-------------------------
**Additional Tips:**

- Consult the official VS Code documentation for more advanced debugging configurations: 
    https://code.visualstudio.com/docs/editor/debugging
- Refer to the Rust analyzer documentation for detailed information on configuration options: 
    https://rust-analyzer.github.io/manual.html
    https://rust-analyzer.github.io/manual.html#vs-code
------------------------------------------------------------------------------------------------------------------------------
To uninstall vscode extensions execute uninstall-vscode-extensions.sh inside vscode terminal.

# First add execute permission to this file and then execute.

# chmod +x uninstall-vscode-extensions.sh
# ./uninstall-vscode-extensions.sh

----------------------------------------------------------------------------------------------------------------------------

Note : folder whose names starts with '.' are hidden by default. So, ensure that you have checked the option show hiden files.

-----------------------------------------------------------------------------------------------------------------------------
