# BreadInTheSky
BitS: Bread in The Sky, an Odyssey 2 Pickaxe Pete editor

In the editor you load a Pick Axe Pete ROM and it tells you which game version it is. Then you can zoom in/out on the interface, and draw lines on the level by click/dragging on the grid area. You can also select a level to edit using the numbers on your keyboard, and then save as a different file.

When saving it keeps the same CRC32 hash by editing a section of unused zeroes in the ROM so that O2em can still recognize which game it is. This was a hassle to achieve and I had to resort to help from the community, especially Catan from GMS2 forums, who actually provided a working script to do that calculation.

"Bread in the sky" translates to "pão no céu", a little joke about the localization this game got in Brazil. Fortunately, its acronym is BITS.

This tool is written in GML. GameMaker version 2.3 was used.

Only tested on Windows but may be adapted and compiled into other platforms if a proper license is used.
