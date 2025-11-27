# omni-fedora

| chicken | dnf               | go                                                         | npm                              | omni           | pip          | rustup        |
|:--------|:------------------|:-----------------------------------------------------------|:---------------------------------|:---------------|:-------------|:--------------|
| srfi-1  | chicken           | github.com/go-delve/delve/cmd/dlv@latest                   | @ansible/ansible-language-server | ansible/fedora | ansible      | clippy        |
| srfi-13 | chicken-libs      | github.com/golangci/golangci-lint/cmd/golangci-lint@latest | bash-language-server             | bash/fedora    | ansible-lint | rust-analyzer |
| srfi-69 | chicken-static    | github.com/goreleaser/goreleaser/v2@latest                 | release-please                   | c/fedora       | molecule     | rust-src      |
| utf8    | clang             | golang.org/x/tools/cmd/goimports@latest                    | yaml-language-server             | chicken/fedora | yamllint     |               |
|         | clang-tools-extra | golang.org/x/tools/gopls@latest                            |                                  | go/fedora      |              |               |
|         | gcc               |                                                            |                                  | rust/fedora    |              |               |
|         | gdb               |                                                            |                                  |                |              |               |
|         | git               |                                                            |                                  |                |              |               |
|         | golang            |                                                            |                                  |                |              |               |
|         | hadolint          |                                                            |                                  |                |              |               |
|         | ltrace            |                                                            |                                  |                |              |               |
|         | make              |                                                            |                                  |                |              |               |
|         | npm               |                                                            |                                  |                |              |               |
|         | podman-remote     |                                                            |                                  |                |              |               |
|         | python3           |                                                            |                                  |                |              |               |
|         | python3-pip       |                                                            |                                  |                |              |               |
|         | redhat-rpm-config |                                                            |                                  |                |              |               |
|         | ripgrep           |                                                            |                                  |                |              |               |
|         | rlwrap            |                                                            |                                  |                |              |               |
|         | shellcheck        |                                                            |                                  |                |              |               |
|         | shfmt             |                                                            |                                  |                |              |               |
|         | strace            |                                                            |                                  |                |              |               |
|         | trivy             |                                                            |                                  |                |              |               |

1. Create a `.mkdev` directory at the root of the project.
2. Copy all the boilerplate files into the `.mkdev` directory.
3. Move the `Makefile` to the root of the project.

*For more information, see <https://github.com/ttybitnik/mkdev>.*
