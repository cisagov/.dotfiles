# .dotfiles - Portable configuration files #

[![GitHub Build Status](https://github.com/cisagov/.dotfiles/workflows/build/badge.svg)](https://github.com/cisagov/.dotfiles/actions)

This is an example repository for using a `.dotfiles` repository with `stow`
to make your preferences portable across machines.

Fork this repo so you can customize it with your own information.

## Prerequisites ##

You'll need a working installation of [`stow`](https://www.gnu.org/software/stow/).
The easiest way is [Homebrew](https://brew.sh).

## Repo Usage ##

1. Check out the repository into your home directory:

```sh
cd ~
git clone git@github.com:cisagov/.dotfiles.git
```

1. Stow all the packages from `.dotfiles` into your home directory either via
the [`deploy.sh` script](deploy.sh).

## Customization ##

You'll want to make some changes, e.g. username and email should be set to your
own. You can do this by editing the files in your new `~/.dotfiles` folder.

Generate a GPG key to sign your git commits etc and add it to the `.gitconfig`
file - follow the prompts:

```bash
gpg --gen-key
```

## New Repositories from a Skeleton ##

Please see our [Project Setup guide](https://github.com/cisagov/development-guide/tree/develop/project_setup)
for step-by-step instructions on how to start a new repository from
a skeleton. This will save you time and effort when configuring a
new repository!

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
