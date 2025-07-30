# chicken-fedora

| chicken | dnf               |
|:--------|:------------------|
| utf8    | git               |
| srfi-1  | make              |
| srfi-13 | ripgrep           |
| srfi-69 | rlwrap            |
|         | chicken           |
|         | chicken-static    |
|         | chicken-libs      |
|         | gcc               |
|         | clang             |
|         | clang-tools-extra |
|         | gdb               |
|         | redhat-rpm-config |

1. Create a `.mkdev` directory at the root of the project.
2. Copy all the boilerplate files into the `.mkdev` directory.
3. Move the `Makefile` to the root of the project.

*For more information, see <https://github.com/ttybitnik/mkdev>.*
