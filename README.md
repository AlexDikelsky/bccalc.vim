This plugin changes superscripts into bc-compatible notation. For example, running

    <leader>bc

on the line

    3³

yields 27. In addition, 

    atan(1234) * 2

will be parsed correctly even though `bc` names the arctan function `t(x)`

To run on a single line, type \<leader\>bc. This replaces the current register with
the line, then makes the input bc-readable. You can also type <leader>bc on a visual selection. For example, selecting

    a = 2
    b = 3
    (a * b)²
    
then typing `<leader>bc` prints `answer = 36`. In addition, the unnamed register is filled with the answer.

[![asciicast](https://asciinema.org/a/290011.svg)](https://asciinema.org/a/290011)
