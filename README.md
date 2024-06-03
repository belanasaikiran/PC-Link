# PC-Link
A Linux app that synchronises the incoming texts and calls from your android phone.


### Architecture

![Architecture](./Flow/Architecture.png)

### Finalized Tech Stack

![Tech_Stack](./Flow/TechStack.png)


### Possible Implementation for GUI

1. Flutter:

    > Programming Language: Dart

    > Database: SQLite

    Upon on basic search on internet, we can use flutter to build native desktop applications which are much better than electron based or react-native. 

    For both Mobile and Desktop applications, I will be using Flutter. I'm completely new at the time of writing this but I'll eventually learn and implement the logic for this application. 


2. Dear ImGUI:

    [Dear ImGui](https://github.com/ocornut/imgui): Bloat-free Graphical User interface for C++ with minimal dependencies. 

    Setup for ImGUI:

    I'll be using `glut` library for the rendering. 

    ```bash
    sudo apt install freeglut3-dev g++ make cmake
    ```

    [Optionally `x11` for docker container]

    ```bash
    sudo apt install x11 x11-apps
    ```


## Contributions / Collaboration

Please reach out to me at [linkedin.com/in/belanasaikiran](https://www.linkedin.com/in/belanasaikiran)