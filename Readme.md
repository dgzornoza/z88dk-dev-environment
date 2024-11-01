# z88dk-dev-environment README

z88dk Developer Container Environment for Visual Studio Code.
Author: David González Zornoza

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

<https://github.com/dgzornoza/z88dk-dev-environment/assets/7240189/b688a008-af47-4b45-b31c-d45f6e889f59>

## Options

The sample is developed to use standard lib and new lib, by default is new lib. If you want to use classic lib, You'll need to leave the `clib` parameter empty in the makefile and set `define CLASSIC 1` in main.c file.

## Remarks

Container name is created based in folder project name, you can create other folders based on this repository with other names for more projects.
The first time it download docker hub image with the Z88DK sources from 2024-10-31.

Source sample is from: <https://www.z88dk.org/wiki/doku.php?id=temp:front#mixing_c_and_assembly_language>

## Links of interest

- z88dk: <https://z88dk.org/site/>
- zx spectrum starter guide: <https://github.com/z88dk/z88dk/blob/master/doc/ZXSpectrumZSDCCnewlib_01_GettingStarted.md>
- mixing C and ASM <https://www.z88dk.org/wiki/doku.php?id=temp:front#mixing_c_and_assembly_language>
- CRTs reference <https://github.com/z88dk/z88dk/blob/master/doc/ZXSpectrumZSDCCnewlib_02_HelloWorld.md>
- ASM tutorial <https://wiki.speccy.org/cursos/ensamblador/indice>
- ASM tutorials and sample coe <https://espamatica.com/>

## Releases

### 2.3.0 2024/10/31

- Improved debugging system, allowing you to debug asm files by unifying the lis files
- Updated to z88dk v2.3.0 (2024-10-31)

### 2.2.0

- Initial release aligned with z88dk v2.2

**Enjoy!**
