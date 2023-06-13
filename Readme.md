# z88dk-dev-environment README

z88dk Developer Container Environment for Visual Studio Code.

## Features

Project to set up a development environment for zx spectrum with z88dk in a visual studio code dev-container.

Environment using DeZog for debugging ASM with C source code tags.

## Requirements

- installed visual studio code dev-container extension:
  [https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers](vscode-remote.remote-containers)

- Docker environment

## How to use

- Download repository
- Set the folder name to the desired project name
- Open folder with Visual Studio Code
- Press F1, then execute `Dev Containers: Reopen in container`
- Wait for install container and recomended extensions
- Execute build task Ctrl + Shift + B (Build)
- Set break point in main.c.lis and press F5 to debug
- All ready to develop your project

https://github.com/dgzornoza/z88dk-dev-environment/assets/7240189/b688a008-af47-4b45-b31c-d45f6e889f59

## Remarks

Container name is created based in folder project name, you can create other folders based on this repository with other names for more projects.
The first time it download docker hub image with the Z88DK sources from 2023-06-12.

## Releases

### 2.2.0

Initial release aligned with z88dk v2.2

**Enjoy!**
