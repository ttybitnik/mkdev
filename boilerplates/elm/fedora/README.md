# elm-fedora

| curl                                                                                | dnf     | npm                              |
|:------------------------------------------------------------------------------------|:--------|:---------------------------------|
| https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz | git     | @elm-tooling/elm-language-server |
|                                                                                     | make    | elm-format                       |
|                                                                                     | ripgrep | elm-review                       |
|                                                                                     | nodejs  |                                  |
|                                                                                     | npm     |                                  |

1. Create a `.mkdev` directory at the root of the project.
2. Copy all the boilerplate files into the `.mkdev` directory.
3. Move the `Makefile` to the root of the project.

*For more information, see <https://github.com/ttybitnik/mkdev>.*
