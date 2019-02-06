Intellij
========

Reformat on save
----------------

With 3 simple steps you can reorder and reformat your code automatically with ⌘ + S. That shortcut you are used to press constantly although you know Android Studio automatically saves all files for you . Give ⌘ + S a different meaning:

    Make sure a Java source file has focus (or you can’t record all steps)
    - Select Edit > Macros > Start Macro Recording
    - Select Code > Optimize Imports
    - Select Code > Reformat Code
    - Select Code > Rearrange Code
    - Select File > Save All
    - Select Edit > Macros > Stop Macro Recording and give it a name (mine is OptimizeImportsReformatRearrangeSave)
    Go to Preferences > Keymap
    - Find the Macro section
    - Add ⌘ + S shortcut for the new macro

Alternatively you can reformat code with ⌥+⌘+L . When you select parts of your code, only those get reformatted. This doesn’t reorder your code or changes imports. I use it when touching code which doesn’t have a code style.