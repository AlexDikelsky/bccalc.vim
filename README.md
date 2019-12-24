This plugin evaluates mathematical expressions. For example, running

    <leader>bc

on the line

    3³

yields 27. In addition, 

    atan(1234) * 2

will result in ~π.

To run on a single line, type `<leader>bc`. 
The unnamed register (which can be "put" by typing `p`) will now contain the result of the expression.
You can also type `<leader>bc` on a visual selection. For example, selecting

    a = 2
    b = 3
    (a * b)²
    
then typing `<leader>bc` prints `answer = 36`. Note that the register is not affected when using a visual selection.
If you run an expression like

    a++
    a++
    a++

`bc` will usually print the output 0, 1, 2, all on separate lines. However, with this plugin, the string
"0, 1, 2" will be printed all on one line, separated by commas and spaces.

You can install this by running

    mkdir -p ~/.vim/pack/plugin/start
    cd ~/.vim/pack/plugin/start
    git clone https://github.com/AlexDikelsky/bccalc.vim
    vim -u NONE -c "helptags bccalc.vim/doc" -c q

or by using a package manager. `bc` is needed to run this plugin properly, so it is unlikely to work on Windows.

[![asciicast](https://asciinema.org/a/290011.svg)](https://asciinema.org/a/290011)
