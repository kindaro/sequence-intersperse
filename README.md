# Benchmarking various implementations of `intersperse`.

Run like this:

    % cabal run sequence-intersperse -- +RTS -p -hr -i0.01 &&
        hp2ps -c sequence-intersperse.hp &&
        ps2pdf sequence-intersperse.ps &&
        zathura sequence-intersperse.pdf

— To obtain interesting colourful pictures.

