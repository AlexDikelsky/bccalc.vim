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
    
then typing `<leader>bc` prints `answer = 36`.

You can install this by running

    mkdir -p ~/.vim/pack/AlexDikelsky/start
    cd ~/.vim/pack/AlexDikelsky/start
    git clone https://github.com/AlexDikelsky/bccalc.vim
    vim -u NONE -c "helptags bccalc.vim/doc" -c q

or by using a package manager.

[![asciicast](https://asciinema.org/a/290011.svg)](https://asciinema.org/a/290011)
